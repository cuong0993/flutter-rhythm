// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GameLoading extends GameLoading {
  factory _$GameLoading([void Function(GameLoadingBuilder)? updates]) =>
      (new GameLoadingBuilder()..update(updates)).build();

  _$GameLoading._() : super._();

  @override
  GameLoading rebuild(void Function(GameLoadingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GameLoadingBuilder toBuilder() => new GameLoadingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GameLoading;
  }

  @override
  int get hashCode {
    return 767756058;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GameLoading').toString();
  }
}

class GameLoadingBuilder implements Builder<GameLoading, GameLoadingBuilder> {
  _$GameLoading? _$v;

  GameLoadingBuilder();

  @override
  void replace(GameLoading other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GameLoading;
  }

  @override
  void update(void Function(GameLoadingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GameLoading build() {
    final _$result = _$v ?? new _$GameLoading._();
    replace(_$result);
    return _$result;
  }
}

class _$GameStarted extends GameStarted {
  @override
  final List<Tile> tiles;
  @override
  final double speedPixelsPerSecond;
  @override
  final int duration;
  @override
  final String songName;

  factory _$GameStarted([void Function(GameStartedBuilder)? updates]) =>
      (new GameStartedBuilder()..update(updates)).build();

  _$GameStarted._(
      {required this.tiles,
      required this.speedPixelsPerSecond,
      required this.duration,
      required this.songName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(tiles, 'GameStarted', 'tiles');
    BuiltValueNullFieldError.checkNotNull(
        speedPixelsPerSecond, 'GameStarted', 'speedPixelsPerSecond');
    BuiltValueNullFieldError.checkNotNull(duration, 'GameStarted', 'duration');
    BuiltValueNullFieldError.checkNotNull(songName, 'GameStarted', 'songName');
  }

  @override
  GameStarted rebuild(void Function(GameStartedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GameStartedBuilder toBuilder() => new GameStartedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GameStarted &&
        tiles == other.tiles &&
        speedPixelsPerSecond == other.speedPixelsPerSecond &&
        duration == other.duration &&
        songName == other.songName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, tiles.hashCode), speedPixelsPerSecond.hashCode),
            duration.hashCode),
        songName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GameStarted')
          ..add('tiles', tiles)
          ..add('speedPixelsPerSecond', speedPixelsPerSecond)
          ..add('duration', duration)
          ..add('songName', songName))
        .toString();
  }
}

class GameStartedBuilder implements Builder<GameStarted, GameStartedBuilder> {
  _$GameStarted? _$v;

  List<Tile>? _tiles;
  List<Tile>? get tiles => _$this._tiles;
  set tiles(List<Tile>? tiles) => _$this._tiles = tiles;

  double? _speedPixelsPerSecond;
  double? get speedPixelsPerSecond => _$this._speedPixelsPerSecond;
  set speedPixelsPerSecond(double? speedPixelsPerSecond) =>
      _$this._speedPixelsPerSecond = speedPixelsPerSecond;

  int? _duration;
  int? get duration => _$this._duration;
  set duration(int? duration) => _$this._duration = duration;

  String? _songName;
  String? get songName => _$this._songName;
  set songName(String? songName) => _$this._songName = songName;

  GameStartedBuilder();

  GameStartedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tiles = $v.tiles;
      _speedPixelsPerSecond = $v.speedPixelsPerSecond;
      _duration = $v.duration;
      _songName = $v.songName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GameStarted other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GameStarted;
  }

  @override
  void update(void Function(GameStartedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GameStarted build() {
    final _$result = _$v ??
        new _$GameStarted._(
            tiles: BuiltValueNullFieldError.checkNotNull(
                tiles, 'GameStarted', 'tiles'),
            speedPixelsPerSecond: BuiltValueNullFieldError.checkNotNull(
                speedPixelsPerSecond, 'GameStarted', 'speedPixelsPerSecond'),
            duration: BuiltValueNullFieldError.checkNotNull(
                duration, 'GameStarted', 'duration'),
            songName: BuiltValueNullFieldError.checkNotNull(
                songName, 'GameStarted', 'songName'));
    replace(_$result);
    return _$result;
  }
}

class _$LoadingGift extends LoadingGift {
  factory _$LoadingGift([void Function(LoadingGiftBuilder)? updates]) =>
      (new LoadingGiftBuilder()..update(updates)).build();

  _$LoadingGift._() : super._();

  @override
  LoadingGift rebuild(void Function(LoadingGiftBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoadingGiftBuilder toBuilder() => new LoadingGiftBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoadingGift;
  }

  @override
  int get hashCode {
    return 143063387;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('LoadingGift').toString();
  }
}

class LoadingGiftBuilder implements Builder<LoadingGift, LoadingGiftBuilder> {
  _$LoadingGift? _$v;

  LoadingGiftBuilder();

  @override
  void replace(LoadingGift other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoadingGift;
  }

  @override
  void update(void Function(LoadingGiftBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoadingGift build() {
    final _$result = _$v ?? new _$LoadingGift._();
    replace(_$result);
    return _$result;
  }
}

class _$GameCompleted extends GameCompleted {
  @override
  final GameReward gameReward;

  factory _$GameCompleted([void Function(GameCompletedBuilder)? updates]) =>
      (new GameCompletedBuilder()..update(updates)).build();

  _$GameCompleted._({required this.gameReward}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        gameReward, 'GameCompleted', 'gameReward');
  }

  @override
  GameCompleted rebuild(void Function(GameCompletedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GameCompletedBuilder toBuilder() => new GameCompletedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GameCompleted && gameReward == other.gameReward;
  }

  @override
  int get hashCode {
    return $jf($jc(0, gameReward.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GameCompleted')
          ..add('gameReward', gameReward))
        .toString();
  }
}

class GameCompletedBuilder
    implements Builder<GameCompleted, GameCompletedBuilder> {
  _$GameCompleted? _$v;

  GameRewardBuilder? _gameReward;
  GameRewardBuilder get gameReward =>
      _$this._gameReward ??= new GameRewardBuilder();
  set gameReward(GameRewardBuilder? gameReward) =>
      _$this._gameReward = gameReward;

  GameCompletedBuilder();

  GameCompletedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _gameReward = $v.gameReward.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GameCompleted other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GameCompleted;
  }

  @override
  void update(void Function(GameCompletedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GameCompleted build() {
    _$GameCompleted _$result;
    try {
      _$result = _$v ?? new _$GameCompleted._(gameReward: gameReward.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'gameReward';
        gameReward.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GameCompleted', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
