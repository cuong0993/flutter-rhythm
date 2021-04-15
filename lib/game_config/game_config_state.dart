import 'package:built_value/built_value.dart';

part 'game_config_state.g.dart';

abstract class GameConfigState
    implements Built<GameConfigState, GameConfigStateBuilder> {
  factory GameConfigState([Function(GameConfigStateBuilder) updates]) =
      _$GameConfigState;

  GameConfigState._();

  int get difficulty;

  int get speed;
}
