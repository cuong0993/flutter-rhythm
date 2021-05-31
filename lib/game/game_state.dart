import 'package:freezed_annotation/freezed_annotation.dart';

import 'game_reward.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  factory GameState.loading() = GameStateLoading;

  factory GameState.playing(int duration, String songName) = GameStatePlaying;

  factory GameState.gettingGift() = GameStateGettingGift;

  factory GameState.completed(GameReward gameReward) = GameStateCompleted;
}
