import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_reward.freezed.dart';
part 'game_reward.g.dart';

@freezed
class GameReward with _$GameReward {
  factory GameReward(
    int stars,
    int playedNotes,
  ) = _GameReward;

  factory GameReward.fromJson(Map<String, dynamic> json) =>
      _$GameRewardFromJson(json);
}
