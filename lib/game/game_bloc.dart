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
import '../serializers.dart';
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

  int _maxTime;
  int _tilesCount = 0;
  double _speedDpsPerSecond;
  List<TileChunk> _tileChunks;
  int _unitDuration;
  var _errorCount = 0;
  var _numberTileColumn = 0;
  var _difficulty = 0;
  var _speed = 0;

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
      final song = event.song;
      final tempFile = File('${directory.path}/${song.url}');
      if (!tempFile.existsSync()) {
        await tempFile.create(recursive: true);
        final task = FirebaseStorage.instance
            .ref()
            .child(song.url)
            .writeToFile(tempFile);
        await task;
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
      _difficulty = event.difficulty;
      if (event.difficulty == 0) {
        _numberTileColumn = 2;
      } else if (event.difficulty == 1) {
        _numberTileColumn = 3;
      } else {
        _numberTileColumn = 4;
      }
      _speed = event.speed;
      var bpm = 0;
      if (event.speed == 0) {
        bpm = (song.bpm * 0.75).toInt();
      } else if (event.speed == 2) {
        bpm = (song.bpm * 1.25).toInt();
      } else {
        bpm = song.bpm;
      }
      final tiles = createTiles(_tileChunks, _unitDuration, _numberTileColumn);
      final tick2Second = tickToSecond(midiFile.header.ticksPerBeat, bpm);
      final speedDpsPerTick = UNIT_DURATION_HEIGHT / _unitDuration;
      _speedDpsPerSecond = speedDpsPerTick / tick2Second;
      final gameDuration =
          (0.5 + (0.0 - tiles.last.initialY) / _speedDpsPerSecond).toInt();
      _songName = song.title;
      _songId = song.id;
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
      final response =
          await FirebaseFunctions.instance.httpsCallable('getGameReward').call({
        'songId': _songId,
        'difficulty': _difficulty,
        'speed': _speed,
        'errorCount': _errorCount,
      });
      final gameReward = serializers.deserializeWith<GameReward>(
          GameReward.serializer, Map<String, dynamic>.from(response.data));
      _completeEventController.add(gameReward);
    } else if (event is RestartGame) {
      _time = 0.0;
      _tilesCount = 0;
      _errorCount = 0;
      final tiles = createTiles(_tileChunks, _unitDuration, _numberTileColumn);
      yield GameStarted(tiles, _speedDpsPerSecond, _maxTime);
      await Future.delayed(Duration(milliseconds: 100));
      yield GameUpdated(_tilesCount, _songName, _time, _maxTime);
    }
  }
}
