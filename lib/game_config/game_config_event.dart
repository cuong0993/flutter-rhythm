part of 'game_config_bloc.dart';

abstract class GameConfigEvent extends Equatable {
  const GameConfigEvent();
}

class GameConfigChangeDifficultyEvent extends GameConfigEvent {
  final int difficulty;

  const GameConfigChangeDifficultyEvent(this.difficulty);

  @override
  List<Object> get props => [difficulty];
}

class GameConfigChangeSpeedEvent extends GameConfigEvent {
  final int speed;

  const GameConfigChangeSpeedEvent(this.speed);

  @override
  List<Object> get props => [speed];
}
