part of 'game_config_bloc.dart';

class GameConfigState extends Equatable {
  final int difficulty;
  final int speed;

  const GameConfigState(this.difficulty, this.speed);

  @override
  List<Object> get props => [difficulty, speed];
}
