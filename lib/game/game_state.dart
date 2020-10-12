import 'package:equatable/equatable.dart';

import 'tile/tile.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

class GameLoading extends GameState {}

class GameStarted extends GameState {
  final List<Tile> tiles;
  final double speedPixelsPerSecond;
  final double gameDuration;

  GameStarted(this.tiles, this.speedPixelsPerSecond, this.gameDuration);

  @override
  List<Object> get props => [tiles, speedPixelsPerSecond, gameDuration];
}

class GameNotLoaded extends GameState {}
