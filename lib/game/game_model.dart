import 'dart:async';
import 'dart:io';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:dart_midi/dart_midi.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../midi_processor.dart';
import '../serializers.dart';
import '../songs/song.dart';
import '../util.dart';
import 'game_reward.dart';
import 'game_state.dart';
import 'tile/tile.dart';
import 'tile/tile_chunk.dart';
import 'tile/tile_converter.dart';

final tilesCountProvider = StateProvider.autoDispose((ref) => 0);
final timeProvider = StateProvider.autoDispose((ref) => 0.0);
final guideTextProvider = StateProvider.autoDispose((ref) => '');
final isPausedProvider = StateProvider.autoDispose((ref) => false);

final gameStateFamilyProvider = StateNotifierProvider.autoDispose
    .family<GameModel, GameState, Map>((ref, arguments) {
  final song = arguments['song'] as Song;
  final difficulty = arguments['difficulty'] as int;
  final speed = arguments['speed'] as int;
  final gameModel = GameModel(ref.read).._startGame(song, difficulty, speed);
  return gameModel;
});

class GameModel extends StateNotifier<GameState> {
  GameModel(this._read) : super(GameLoading());
  final Reader _read;
  List<TileChunk> _tileChunks = [];
  int _unitDuration = 0;
  var _difficulty = 0;
  var _numberTileColumn = 0;
  var _speed = 0;
  double _speedDpsPerSecond = 0;
  String _songName = '';
  String _songId = '';
  double _time = 0;
  int _tilesCount = 0;
  int _errorCount = 0;
  int _duration = 0;

  Future _startGame(Song song, int difficulty, int speed) async {
    final directory = await getApplicationSupportDirectory();
    final tempFile = File('${directory.path}/${song.url}');
    if (!tempFile.existsSync()) {
      await tempFile.create(recursive: true);
      final task =
          FirebaseStorage.instance.ref().child(song.url).writeToFile(tempFile);
      await task;
    }
    final midiFile = MidiParser().parseMidiFromFile(tempFile);
    _tileChunks = createTileChunks(midiFile);
    _unitDuration = song.unitDuration;
    _difficulty = difficulty;
    if (difficulty == 0) {
      _numberTileColumn = 2;
    } else if (difficulty == 1) {
      _numberTileColumn = 3;
    } else {
      _numberTileColumn = 4;
    }
    _speed = speed;
    var bpm = 0;
    if (speed == 0) {
      bpm = (song.bpm * 0.75).toInt();
    } else if (speed == 2) {
      bpm = (song.bpm * 1.25).toInt();
    } else {
      bpm = song.bpm;
    }
    final tiles = createTiles(_tileChunks, _unitDuration, _numberTileColumn);
    final tick2Second = tickToSecond(midiFile.header.ticksPerBeat, bpm);
    final speedDpsPerTick = unitDurationHeight / _unitDuration;
    _speedDpsPerSecond = speedDpsPerTick / tick2Second;
    final duration =
        (0.5 + (0.0 - tiles.last.initialY) / _speedDpsPerSecond).toInt();
    _songName = song.title;
    _songId = song.id;
    _time = 0.0;
    _tilesCount = 0;
    _errorCount = 0;
    _duration = duration;
    final soundLoadedStream = MidiProcessor.getInstance().soundLoadedStream;
    await for (final value in soundLoadedStream) {
      if (value) {
        state = GameStarted((b) => b
          ..tiles = tiles
          ..speedPixelsPerSecond = _speedDpsPerSecond
          ..duration = _duration
          ..songName = _songName);
        return;
      }
    }
  }

  Future touchTile(Tile? tile) async {
    var guideText = '';
    if (tile != null) {
      await MidiProcessor.getInstance().playNote(tile.note);
      _tilesCount += 1;
      _time = (0.0 - tile.initialY) / _speedDpsPerSecond;
      _read(tilesCountProvider).state = _tilesCount;
      _read(timeProvider).state = _time;
      if (tile.y >= pauseY) {
        _errorCount++;
        guideText = 'txt_too_late';
      } else if (tile.y < pauseY - 120) {
        _errorCount++;
        guideText = 'txt_too_early';
      }
    } else {
      _errorCount++;
      guideText = 'txt_too_many_fingers';
    }
    _read(guideTextProvider).state = guideText;
  }

  Future complete() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    state = LoadingGift();
    final response = await FirebaseFunctions.instance
        .httpsCallable('GetGameReward')
        .call<Map>({
      'songId': _songId,
      'difficulty': _difficulty,
      'speed': _speed,
      'errorCount': _errorCount,
    });
    final gameReward = serializers.deserializeWith<GameReward>(
        GameReward.serializer, Map<String, dynamic>.from(response.data));
    state = GameCompleted((b) => b..gameReward = gameReward!.toBuilder());
  }

  Future restart() async {
    _time = 0.0;
    _tilesCount = 0;
    _errorCount = 0;
    final tiles = createTiles(_tileChunks, _unitDuration, _numberTileColumn);
    state = GameStarted((b) => b
      ..tiles = tiles
      ..speedPixelsPerSecond = _speedDpsPerSecond
      ..duration = _duration
      ..songName = _songName);
    _read(tilesCountProvider).state = _tilesCount;
    _read(timeProvider).state = _time;
    _read(guideTextProvider).state = '';
  }
}
