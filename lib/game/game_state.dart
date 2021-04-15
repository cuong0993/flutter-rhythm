import 'package:built_value/built_value.dart';

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

  int get gameDuration;
}

abstract class GameUpdated
    implements Built<GameUpdated, GameUpdatedBuilder>, GameState {
  factory GameUpdated([Function(GameUpdatedBuilder) updates]) = _$GameUpdated;

  GameUpdated._();

  int get tilesCount;

  String get songName;

  double get time;

  int get maxTime;
}

abstract class LoadingGift
    implements Built<LoadingGift, LoadingGiftBuilder>, GameState {
  factory LoadingGift([Function(LoadingGiftBuilder) updates]) = _$LoadingGift;

  LoadingGift._();
}

abstract class GameNotLoaded
    implements Built<GameNotLoaded, GameNotLoadedBuilder>, GameState {
  factory GameNotLoaded([Function(GameNotLoadedBuilder) updates]) =
      _$GameNotLoaded;

  GameNotLoaded._();
}
