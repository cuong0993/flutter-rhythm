import 'package:json_annotation/json_annotation.dart';

part 'game_reward.g.dart';

@JsonSerializable(explicitToJson: true)
class GameReward {
  int stars;
  int playedNotes;

  GameReward(
    this.stars,
    this.playedNotes,
  );

  factory GameReward.fromJson(Map<String, dynamic> json) =>
      _$GameRewardFromJson(json);

  Map<String, dynamic> toJson() => _$GameRewardToJson(this);
}
