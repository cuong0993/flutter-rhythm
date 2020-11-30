part of 'game_config_bloc.dart';

class GameConfigEvent extends Equatable {
  final int difficulty;

  const GameConfigEvent(this.difficulty);

  @override
  List<Object> get props => [difficulty];
}
