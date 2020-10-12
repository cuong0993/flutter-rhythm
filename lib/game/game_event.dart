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

  const StartGame(this.song);

  @override
  List<Object> get props => [song];

  @override
  String toString() => 'StartGame { song: $song }';
}

class TileTouched extends GameEvent {
  final Tile tile;

  const TileTouched(this.tile);

  @override
  List<Object> get props => [tile];

  @override
  String toString() => 'TileTouched { tile: $tile }';
}
