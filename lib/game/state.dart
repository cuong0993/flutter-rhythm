import 'package:equatable/equatable.dart';

import 'tile.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

class GameLoading extends GameState {}

class GameStarted extends GameState {
  final List<Tile> tiles;
  final double speedPixelsPerSecond;

  GameStarted(this.tiles, this.speedPixelsPerSecond);

  @override
  List<Object> get props => [tiles, speedPixelsPerSecond];
}

class GameNotLoaded extends GameState {}
