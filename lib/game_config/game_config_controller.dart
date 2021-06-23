import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'game_config_state.dart';

final gameConfigStateProvider =
    StateNotifierProvider<GameConfigController, GameConfigState>((ref) {
  return GameConfigController();
});

class GameConfigController extends StateNotifier<GameConfigState> {
  GameConfigController() : super(GameConfigState(difficulty: 1, speed: 1));

  void changeDifficulty(int difficulty) {
    state = state.copyWith(difficulty: difficulty);
  }

  void changeSpeed(int speed) {
    state = state.copyWith(speed: speed);
  }
}
