import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'game_reward.g.dart';

abstract class GameReward implements Built<GameReward, GameRewardBuilder> {
  static Serializer<GameReward> get serializer => _$gameRewardSerializer;

  factory GameReward([Function(GameRewardBuilder b) updates]) = _$GameReward;

  GameReward._();

  int get stars;

  int get playedNotes;
}
