import 'package:built_value/built_value.dart';

part 'game_config_event.g.dart';

abstract class GameConfigEvent {}

abstract class GameConfigChangeDifficultyEvent
    implements
        Built<GameConfigChangeDifficultyEvent,
            GameConfigChangeDifficultyEventBuilder>,
        GameConfigEvent {
  factory GameConfigChangeDifficultyEvent(
          [Function(GameConfigChangeDifficultyEventBuilder) updates]) =
      _$GameConfigChangeDifficultyEvent;

  GameConfigChangeDifficultyEvent._();

  int get difficulty;
}

abstract class GameConfigChangeSpeedEvent
    implements
        Built<GameConfigChangeSpeedEvent, GameConfigChangeSpeedEventBuilder>,
        GameConfigEvent {
  factory GameConfigChangeSpeedEvent(
          [Function(GameConfigChangeSpeedEventBuilder) updates]) =
      _$GameConfigChangeSpeedEvent;

  GameConfigChangeSpeedEvent._();

  int get speed;
}
