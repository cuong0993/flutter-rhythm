// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_reward.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameReward _$GameRewardFromJson(Map<String, dynamic> json) {
  return GameReward(
    json['stars'] as int,
    json['experiences'] as int,
  );
}

Map<String, dynamic> _$GameRewardToJson(GameReward instance) =>
    <String, dynamic>{
      'stars': instance.stars,
      'experiences': instance.experiences,
    };
