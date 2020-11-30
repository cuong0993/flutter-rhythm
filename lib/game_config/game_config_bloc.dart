import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_config_event.dart';
part 'game_config_state.dart';

class GameConfigBloc extends Bloc<GameConfigEvent, GameConfigState> {
  GameConfigBloc() : super(GameConfigState(2));

  @override
  Stream<GameConfigState> mapEventToState(
    GameConfigEvent event,
  ) async* {
    yield GameConfigState(event.difficulty);
  }
}
