import 'package:built_value/built_value.dart';

import '../game/tile/tile.dart';
import '../songs/song.dart';

part 'game_event.g.dart';

abstract class GameEvent {}

abstract class StartGame
    implements Built<StartGame, StartGameBuilder>, GameEvent {
  Song get song;

  int get difficulty;

  int get speed;

  factory StartGame([Function(StartGameBuilder) updates]) = _$StartGame;

  StartGame._();
}

abstract class RestartGame
    implements Built<RestartGame, RestartGameBuilder>, GameEvent {
  String get type;

  factory RestartGame([Function(RestartGameBuilder) updates]) = _$RestartGame;

  RestartGame._();
}

abstract class PauseGame
    implements Built<PauseGame, PauseGameBuilder>, GameEvent {
  String get type;

  factory PauseGame([Function(PauseGameBuilder) updates]) = _$PauseGame;

  PauseGame._();
}

abstract class CompleteGame
    implements Built<CompleteGame, CompleteGameBuilder>, GameEvent {
  String get type;

  factory CompleteGame([Function(CompleteGameBuilder) updates]) =
      _$CompleteGame;

  CompleteGame._();
}

abstract class TileTouched
    implements Built<TileTouched, TileTouchedBuilder>, GameEvent {
  Tile? get tile;

  factory TileTouched([Function(TileTouchedBuilder) updates]) = _$TileTouched;

  TileTouched._();
}
