import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:collection/collection.dart';
import 'package:dart_midi/dart_midi.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

import '../midi_processor.dart';
import '../util.dart';
import 'game_event.dart';
import 'game_reward.dart';
import 'game_state.dart';
import 'note/note.dart';
import 'tile/tile.dart';
import 'tile/tile_chunk.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameLoading());
  String _songName;
  String _songId;
  double _time = 0;

  double _maxTime;
  int _tilesCount = 0;
  double _speedDpsPerSecond;
  final _pauseEventController = StreamController<bool>();

  Stream<bool> get pauseStream => _pauseEventController.stream;
  final _completeEventController = StreamController<GameReward>();

  Stream<GameReward> get completeStream => _completeEventController.stream;
  final _guideEventController = StreamController<String>();

  Stream<String> get guideStream => _guideEventController.stream;

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
      final speedDpsPerTick = UNIT_DURATION_HEIGHT / unitDuration;
      _speedDpsPerSecond = speedDpsPerTick / tick2Second;
      final gameDuration = (0.0 - tiles.last.initialY) / _speedDpsPerSecond;

      _songName = event.song.title;
      _songId = event.song.id;
      _maxTime = gameDuration;
      final soundLoadedStream = MidiProcessor.getInstance().soundLoadedStream;
      await for (final value in soundLoadedStream) {
        if (value) {
          yield GameStarted(tiles, _speedDpsPerSecond, gameDuration);
          await Future.delayed(Duration(milliseconds: 500));
          yield GameUpdated(_tilesCount, _songName, _time, _maxTime);
          return;
        }
      }
    } else if (event is TileTouched) {
      await MidiProcessor.getInstance().playNote(event.tile.note);
      _tilesCount += 1;
      _time = (0.0 -event.tile.initialY) / _speedDpsPerSecond;
      yield GameUpdated(_tilesCount, _songName, _time, _maxTime);
      if (event.tile.y == pauseY) {
        _guideEventController.add('slow');
      } else if (event.tile.y < pauseY - 120) {
        _guideEventController.add('fast');
      } else {
        _guideEventController.add('normal');
      }
    } else if (event is PauseGame) {
      _pauseEventController.add(true);
    } else if (event is CompleteGame) {
      await Future.delayed(Duration(milliseconds: 1000));
      final response = await FirebaseFunctions.instance
          .httpsCallable('getGameReward')
          .call({'songId': _songId, 'errorCount': 1});
      final gameReward =
          GameReward.fromJson(Map<String, dynamic>.from(response.data));
      _completeEventController.add(gameReward);
    } else if (event is RestartGame) {
      await Future.delayed(Duration(milliseconds: 1000));
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

    var previousStartTick = 0;
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
      -((UNIT_DURATION_HEIGHT / unitDuration) * chunk.startTick +
          calibratedTick);
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
