import 'package:freezed_annotation/freezed_annotation.dart';

import 'game_reward.dart';
import 'tile/tile.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  factory GameState.loading() = GameStateLoading;

  factory GameState.started(List<Tile> tiles, double speedPixelsPerSecond,
      int duration, String songName) = GameStateStarted;

  factory GameState.loadingGift() = GameStateLoadingGift;

  factory GameState.completed(GameReward gameReward) = GameStateCompleted;
}
