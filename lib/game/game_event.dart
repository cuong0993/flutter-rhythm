import 'package:equatable/equatable.dart';

import '../game/tile/tile.dart';
import '../songs/song.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class StartGame extends GameEvent {
  final Song song;
  final int difficulty;
  final int speed;

  const StartGame(this.song, this.difficulty, this.speed);

  @override
  List<Object> get props => [song, difficulty, speed];

  @override
  String toString() => 'StartGame { song: $song }';
}

class RestartGame extends GameEvent {}

class PauseGame extends GameEvent {
  const PauseGame();

  @override
  List<Object> get props => [];
}

class CompleteGame extends GameEvent {
  const CompleteGame();

  @override
  List<Object> get props => [];
}

class TileTouched extends GameEvent {
  final Tile tile;

  const TileTouched(this.tile);

  @override
  List<Object> get props => [tile];

  @override
  String toString() => 'TileTouched { tile: $tile }';
}
