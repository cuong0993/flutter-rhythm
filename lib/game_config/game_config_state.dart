part of 'game_config_bloc.dart';

class GameConfigState extends Equatable {
  final int difficulty;

  const GameConfigState(this.difficulty);
  @override
  List<Object> get props => [difficulty];
}

