import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'game_config_state.dart';

final gameConfigStateProvider =
    StateNotifierProvider<GameConfigModel, GameConfigState>((ref) {
  return GameConfigModel();
});

class GameConfigModel extends StateNotifier<GameConfigState> {
  GameConfigModel()
      : super(GameConfigState((b) => b
          ..speed = 1
          ..difficulty = 1));

  void changeDifficulty(int difficulty) {
    state = state.rebuild((b) => b..difficulty = difficulty);
  }

  void changeSpeed(int speed) {
    state = state.rebuild((b) => b..speed = speed);
  }
}
