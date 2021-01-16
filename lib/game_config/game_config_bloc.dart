import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_config_event.dart';
part 'game_config_state.dart';

class GameConfigBloc extends Bloc<GameConfigEvent, GameConfigState> {
  GameConfigBloc() : super(GameConfigState(1, 1));

  @override
  Stream<GameConfigState> mapEventToState(
    GameConfigEvent event,
  ) async* {
    if (event is GameConfigChangeDifficultyEvent) {
      yield GameConfigState(event.difficulty, state.speed);
    } else if (event is GameConfigChangeSpeedEvent) {
      yield GameConfigState(state.difficulty, event.speed);
    }
  }
}
