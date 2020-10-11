import 'package:equatable/equatable.dart';
import 'package:hitnotes/models/song.dart';

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
