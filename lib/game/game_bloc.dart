import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:dart_midi/dart_midi.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

import '../midi_processor.dart';
import 'game_event.dart';
import 'game_state.dart';
import 'game_util.dart';
import 'note/note.dart';
import 'tile/tile.dart';
import 'tile/tile_chunk.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameLoading());

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {
    if (event is StartGame) {
      final directory = await getApplicationSupportDirectory();
      final tempFile = File('${directory.path}/${event.song.url}');
      if (tempFile.existsSync()) {
        await tempFile.delete();
      }
      await tempFile.create(recursive: true);
      final task = FirebaseStorage.instance
          .ref()
          .child(event.song.url)
          .writeToFile(tempFile);
      await task.future;
      final midiFile = MidiParser().parseMidiFromFile(tempFile);
      final tileChunks = createTileChunks(midiFile);
      final groupByDurationToPrevious = Map.fromEntries(groupBy(
              tileChunks, (TileChunk tileChunk) => tileChunk.durationToPrevious)
          .entries
          .toList()
            ..sort((e1, e2) => e1.key.compareTo(e2.key)));
      final countDurationToPrevious = {
        for (var e in groupByDurationToPrevious.keys)
          e: groupByDurationToPrevious[e].length
      };

      final sortCountDurationToPrevious = Map.fromEntries(
          countDurationToPrevious.entries.toList()
            ..sort((e1, e2) => e1.value.compareTo(e2.value)));
      final unitDuration = sortCountDurationToPrevious.keys.last;
      final tiles = createTiles(tileChunks, unitDuration);
      final tick2Second =
          tickToSecond(midiFile.header.ticksPerBeat, event.song.bpm);
      final speedPixelsPerTick = UNIT_DURATION_HEIGHT / unitDuration;
      final speedPixelsPerSecond = speedPixelsPerTick / tick2Second;
      final gameDuration = tiles.last.initialY / speedPixelsPerSecond;

      yield GameStarted(tiles, speedPixelsPerSecond, gameDuration);
    } else if (event is TileTouched) {
      await MidiProcessor.getInstance().playNote(event.tile.note);
      yield GameUpdated(0);
    }
  }

  List<TileChunk> createTileChunks(MidiFile midiFile) {
    final tileNotes = <Note>[];
    final onsets = List<int>.filled(NUMBER_OF_NOTES, -1, growable: false);
    for (final midiTrack in midiFile.tracks) {
      var totalTicks = 0;
      for (final midiEvent in midiTrack) {
        totalTicks += midiEvent.deltaTime;
        if (midiEvent is NoteOnEvent) {
          final noteValue = midiEvent.noteNumber;
          if (onsets[noteValue] == -1) {
            onsets[noteValue] = totalTicks;
          }
        } else if (midiEvent is NoteOffEvent) {
          final noteValue = midiEvent.noteNumber;
          if (onsets[noteValue] >= 0) {
            tileNotes.add(Note(note: noteValue, startTick: onsets[noteValue]));
            onsets[noteValue] = -1;
          }
        }
      }
    }
    final tileChunks = <TileChunk>[];

    var previousStartTick = -10000;
    Map.fromEntries(
            groupBy(tileNotes, (Note note) => note.startTick).entries.toList()
              ..sort((e1, e2) => e1.key.compareTo(e2.key)))
        .forEach((key, value) {
      tileChunks.add(TileChunk(
          notes: value,
          durationToPrevious: value[0].startTick - previousStartTick,
          startTick: value[0].startTick));
      previousStartTick = value[0].startTick;
    });
    return tileChunks;
  }

  List<Tile> createTiles(List<TileChunk> tileChunks, int unitDuration) {
    final tiles = <Tile>[];
    final random = Random();
    var calibratedTick = 0;
    for (final chunk in tileChunks) {
      var tileColumn = (NUMBER_TILE_COLUMN <= chunk.notes.length)
          ? 0
          : random.nextInt(NUMBER_TILE_COLUMN - chunk.notes.length);
      if (chunk.durationToPrevious < unitDuration) {
        /* Calibrate to make sure a note will away from previous note at least unitTileDuration */
        calibratedTick += unitDuration - chunk.durationToPrevious;
      }
      final initialPositionY =
          ((UNIT_DURATION_HEIGHT / unitDuration) * chunk.startTick +
                  calibratedTick) +
              offsetDrawY;
      chunk.notes.asMap().forEach((index, note) {
        if (index < NUMBER_TILE_COLUMN) {
          final tile = Tile(note.note, tileColumn, initialPositionY);
          tiles.add(tile);
          tileColumn++;
        }
      });
    }
    return tiles;
  }
}
