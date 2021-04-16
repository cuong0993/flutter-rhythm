import 'package:built_value/built_value.dart';

import 'game_reward.dart';
import 'tile/tile.dart';

part 'game_state.g.dart';

abstract class GameState {}

abstract class GameLoading
    implements Built<GameLoading, GameLoadingBuilder>, GameState {
  factory GameLoading([Function(GameLoadingBuilder) updates]) = _$GameLoading;

  GameLoading._();
}

abstract class GameStarted
    implements Built<GameStarted, GameStartedBuilder>, GameState {
  factory GameStarted([Function(GameStartedBuilder) updates]) = _$GameStarted;

  GameStarted._();

  List<Tile> get tiles;

  double get speedPixelsPerSecond;

  int get duration;

  String get songName;
}

abstract class LoadingGift
    implements Built<LoadingGift, LoadingGiftBuilder>, GameState {
  factory LoadingGift([Function(LoadingGiftBuilder) updates]) = _$LoadingGift;

  LoadingGift._();
}

abstract class GameCompleted
    implements Built<GameCompleted, GameCompletedBuilder>, GameState {
  factory GameCompleted([Function(GameCompletedBuilder) updates]) =
      _$GameCompleted;

  GameCompleted._();

  GameReward get gameReward;
}
