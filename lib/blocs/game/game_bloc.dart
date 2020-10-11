import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import "package:collection/collection.dart";
import 'package:dart_midi/dart_midi.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hitnotes/blocs/game/tile.dart';
import 'package:hitnotes/models/note.dart';
import 'package:hitnotes/models/tile_chunk.dart';
import 'package:hitnotes/repositories/songs_repository.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

import 'constants.dart';
import 'game_event.dart';
import 'game_state.dart';
import 'midi_util.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final SongRepository _songsRepository;
  StreamSubscription _songsSubscription;

  GameBloc({@required SongRepository songsRepository})
      : assert(songsRepository != null),
        _songsRepository = songsRepository,
        super(GameLoading());

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {
    if (event is StartGame) {
      final directory = await getApplicationSupportDirectory();
      final File tempFile = File('${directory.path}/${event.song.url}');
      if (tempFile.existsSync()) {
        await tempFile.delete();
      }
      await tempFile.create(recursive: true);
      final StorageFileDownloadTask task = FirebaseStorage.instance
          .ref()
          .child(event.song.url)
          .writeToFile(tempFile);
      await task.future;
      MidiFile midiFile = MidiParser().parseMidiFromFile(tempFile);
      final tileChunks = createTileChunks(midiFile);
      final groupByDurationToPrevious = Map.fromEntries(groupBy(
              tileChunks, (TileChunk tileChunk) => tileChunk.durationToPrevious)
          .entries
          .toList()
            ..sort((e1, e2) => e1.key.compareTo(e2.key)));
      final countDurationToPrevious = new Map.fromIterable(
          groupByDurationToPrevious.keys,
          key: (k) => k,
          value: (v) => groupByDurationToPrevious[v].length);

      final sortCountDurationToPrevious = Map.fromEntries(
          countDurationToPrevious.entries.toList()
            ..sort((e1, e2) => e1.value.compareTo(e2.value)));
      final unitDuration = sortCountDurationToPrevious.values.last;
      final tiles = createTiles(tileChunks, unitDuration);
      final tickToSecond =
          tickToSecond1(midiFile.header.ticksPerBeat, event.song.bpm);
      final speedPixelsPerTick = UNIT_DURATION_HEIGHT / unitDuration;
      final speedPixelsPerSecond = speedPixelsPerTick / tickToSecond;
      //gameDuration = tiles.last.initialY / speedPixelsPerSecond;

      yield GameStarted(tiles, speedPixelsPerSecond);
    }
  }

  List<TileChunk> createTileChunks(MidiFile midiFile) {
    final tileNotes = List<Note>();
    List<int> onsets =
        new List<int>.filled(NUMBER_OF_NOTES, -1, growable: false);
    for (List<MidiEvent> midiTrack in midiFile.tracks) {
      int totalTicks = 0;
      for (MidiEvent midiEvent in midiTrack) {
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
    final tileChunks = List<TileChunk>();

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
    final tiles = List<Tile>();
    final random = Random();
    var calibratedTick = 0;
    for (TileChunk chunk in tileChunks) {
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
              OFFSET_DRAW_POSITION_Y;
      chunk.notes.asMap().forEach((index, note) {
        if (index < NUMBER_TILE_COLUMN) {
          final tile = Tile(note.note, tileColumn, initialPositionY);
          tiles.add(tile);
          tileColumn++;
        }
        /* else {
          break;
        }*/
      });
    }
    return tiles;
  }

  Map<Y, int> countBy<T, Y>(Iterable<T> itr, Y Function(T) fn) {
    return Map.fromIterable(itr.map(fn).toSet(),
        value: (i) => itr.where((v) => fn(v) == i).length);
  }

  @override
  Future<void> close() {
    _songsSubscription?.cancel();
    return super.close();
  }
}
