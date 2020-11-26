import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:collection/collection.dart';
import 'package:dart_midi/dart_midi.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

import '../midi_processor.dart';
import '../util.dart';
import 'game_event.dart';
import 'game_reward.dart';
import 'game_state.dart';
import 'tile/tile_chunk.dart';
import 'tile/tile_converter.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameLoading());
  String _songName;
  String _songId;
  double _time = 0;

  double _maxTime;
  int _tilesCount = 0;
  double _speedDpsPerSecond;
  List<TileChunk> _tileChunks;
  int _unitDuration;
  var _errorCount = 0;

  final _pauseEventController = StreamController<bool>();

  Stream<bool> get pauseStream => _pauseEventController.stream;

  final _completeEventController = StreamController<GameReward>();

  Stream<GameReward> get completeStream => _completeEventController.stream;

  final _guideEventController = BehaviorSubject<String>();

  Stream<String> get guideStream => _guideEventController.stream;

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {
    if (event is StartGame) {
      final directory = await getApplicationSupportDirectory();
      final tempFile = File('${directory.path}/${event.song.url}');
      if (!tempFile.existsSync()) {
        await tempFile.create(recursive: true);
        final task = FirebaseStorage.instance
            .ref()
            .child(event.song.url)
            .writeToFile(tempFile);
        await task.future;
      }
      final midiFile = MidiParser().parseMidiFromFile(tempFile);
      _tileChunks = createTileChunks(midiFile);
      final groupByDurationToPrevious = Map.fromEntries(groupBy(_tileChunks,
              (TileChunk tileChunk) => tileChunk.durationToPrevious)
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
      _unitDuration = sortCountDurationToPrevious.keys.last;
      final tiles = createTiles(_tileChunks, _unitDuration);
      final tick2Second =
          tickToSecond(midiFile.header.ticksPerBeat, event.song.bpm);
      final speedDpsPerTick = UNIT_DURATION_HEIGHT / _unitDuration;
      _speedDpsPerSecond = speedDpsPerTick / tick2Second;
      final gameDuration = (0.0 - tiles.last.initialY) / _speedDpsPerSecond;

      _songName = event.song.title;
      _songId = event.song.id;
      _maxTime = gameDuration;
      final soundLoadedStream = MidiProcessor.getInstance().soundLoadedStream;
      await for (final value in soundLoadedStream) {
        if (value) {
          yield GameStarted(tiles, _speedDpsPerSecond, _maxTime);
          await Future.delayed(Duration(milliseconds: 500));
          yield GameUpdated(_tilesCount, _songName, _time, _maxTime);
          return;
        }
      }
    } else if (event is TileTouched) {
      if (event.tile != null) {
        await MidiProcessor.getInstance().playNote(event.tile.note);
        _tilesCount += 1;
        _time = (0.0 - event.tile.initialY) / _speedDpsPerSecond;
        yield GameUpdated(_tilesCount, _songName, _time, _maxTime);
        if (event.tile.y == pauseY) {
          _errorCount++;
          _guideEventController.add('txt_too_late');
        } else if (event.tile.y < pauseY - 120) {
          _errorCount++;
          _guideEventController.add('txt_too_early');
        } else {
          _guideEventController.add('');
        }
      } else {
        _errorCount++;
        _guideEventController.add('txt_too_many_fingers');
      }
    } else if (event is PauseGame) {
      _pauseEventController.add(true);
    } else if (event is CompleteGame) {
      await Future.delayed(Duration(milliseconds: 500));
      yield LoadingGift();
      final response = await FirebaseFunctions.instance
          .httpsCallable('getGameReward')
          .call({'songId': _songId, 'errorCount': _errorCount});
      final gameReward =
          GameReward.fromJson(Map<String, dynamic>.from(response.data));
      _completeEventController.add(gameReward);
    } else if (event is RestartGame) {
      _time = 0.0;
      _tilesCount = 0;
      _errorCount = 0;
      final tiles = createTiles(_tileChunks, _unitDuration);
      yield GameStarted(tiles, _speedDpsPerSecond, _maxTime);
      await Future.delayed(Duration(milliseconds: 100));
      yield GameUpdated(_tilesCount, _songName, _time, _maxTime);
    }
  }
}
