import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'game_config_state.dart';

final gameConfigStateProvider =
    StateNotifierProvider<GameConfigModel, GameConfigState>((ref) {
  return GameConfigModel();
});

class GameConfigModel extends StateNotifier<GameConfigState> {
  GameConfigModel() : super(GameConfigState(difficulty: 1, speed: 1));

  void changeDifficulty(int difficulty) {
    state = state.copyWith(difficulty: difficulty);
  }

  void changeSpeed(int speed) {
    state = state.copyWith(speed: speed);
  }
}
