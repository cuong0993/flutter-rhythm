import 'dart:async';
import 'dart:io';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:dart_midi/dart_midi.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../midi/midi_controller.dart';
import '../songs/song.dart';
import 'game_reward.dart';
import 'game_state.dart';
import 'my_game.dart';
import 'tile/tile.dart';
import 'tile/tile_chunk.dart';
import 'tile/tile_converter.dart';
import 'util.dart';

final tilesCountProvider = StateProvider.autoDispose((ref) => 0);
final timeProvider = StateProvider.autoDispose((ref) => 0.0);
final guideTextProvider = StateProvider.autoDispose((ref) => '');
final isPausedProvider = StateProvider.autoDispose((ref) => false);

final gameStateFamilyProvider = StateNotifierProvider.autoDispose
    .family<GameController, GameState, Map>((ref, arguments) {
  final song = arguments['song'] as Song;
  final difficulty = arguments['difficulty'] as int;
  final speed = arguments['speed'] as int;

  return GameController(ref).._startGame(song, difficulty, speed);
});

class GameController extends StateNotifier<GameState> {
  GameController(this._read) : super(GameState.loading());
  final StateNotifierProviderRef _read;
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
  final MyGame game = MyGame();

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
    final tick2Second = tickToSecond(midiFile.header.ticksPerBeat!, bpm);
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
    await game.start(tiles, _speedDpsPerSecond, _onTouchTile, _onComplete);
    state = GameState.playing(_duration, _songName);
  }

  void _onTouchTile(Tile? tile) {
    var guideText = '';
    if (tile != null) {
      _read.read(midiLoadedProvider.notifier).playNote(tile.note);
      _tilesCount += 1;
      _time = (0.0 - tile.initialY) / _speedDpsPerSecond;
      _read.read(tilesCountProvider.notifier).state = _tilesCount;
      _read.read(timeProvider.notifier).state = _time;
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
    _read.read(guideTextProvider.notifier).state = guideText;
  }

  Future _onComplete() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    state = GameState.gettingGift();
    final response = await FirebaseFunctions.instance
        .httpsCallable('GetGameReward')
        .call<Map>({
      'songId': _songId,
      'difficulty': _difficulty,
      'speed': _speed,
      'errorCount': _errorCount,
    });
    final gameReward =
        GameReward.fromJson(Map<String, dynamic>.from(response.data));
    state = GameState.completed(gameReward);
  }

  Future<void> onRestart() async {
    _time = 0.0;
    _tilesCount = 0;
    _errorCount = 0;
    final tiles = createTiles(_tileChunks, _unitDuration, _numberTileColumn);
    await game.start(tiles, _speedDpsPerSecond, _onTouchTile, _onComplete);
    state = GameState.playing(_duration, _songName);
    _read.read(tilesCountProvider.notifier).state = _tilesCount;
    _read.read(timeProvider.notifier).state = _time;
    _read.read(guideTextProvider.notifier).state = '';
  }
}
