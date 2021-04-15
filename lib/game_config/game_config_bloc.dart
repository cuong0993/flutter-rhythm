import 'dart:async';

import 'package:bloc/bloc.dart';

import 'game_config_event.dart';
import 'game_config_state.dart';

class GameConfigBloc extends Bloc<GameConfigEvent, GameConfigState> {
  GameConfigBloc()
      : super(GameConfigState((b) => b
          ..speed = 1
          ..difficulty = 1));

  @override
  Stream<GameConfigState> mapEventToState(
    GameConfigEvent event,
  ) async* {
    if (event is GameConfigChangeDifficultyEvent) {
      yield GameConfigState((b) => b
        ..difficulty = event.difficulty
        ..speed = state.speed);
    } else if (event is GameConfigChangeSpeedEvent) {
      yield GameConfigState((b) => b
        ..difficulty = state.difficulty
        ..speed = event.speed);
    }
  }
}
