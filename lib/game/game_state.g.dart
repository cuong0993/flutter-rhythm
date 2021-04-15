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
  final int gameDuration;

  factory _$GameStarted([void Function(GameStartedBuilder)? updates]) =>
      (new GameStartedBuilder()..update(updates)).build();

  _$GameStarted._(
      {required this.tiles,
      required this.speedPixelsPerSecond,
      required this.gameDuration})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(tiles, 'GameStarted', 'tiles');
    BuiltValueNullFieldError.checkNotNull(
        speedPixelsPerSecond, 'GameStarted', 'speedPixelsPerSecond');
    BuiltValueNullFieldError.checkNotNull(
        gameDuration, 'GameStarted', 'gameDuration');
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
        gameDuration == other.gameDuration;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, tiles.hashCode), speedPixelsPerSecond.hashCode),
        gameDuration.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GameStarted')
          ..add('tiles', tiles)
          ..add('speedPixelsPerSecond', speedPixelsPerSecond)
          ..add('gameDuration', gameDuration))
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

  int? _gameDuration;
  int? get gameDuration => _$this._gameDuration;
  set gameDuration(int? gameDuration) => _$this._gameDuration = gameDuration;

  GameStartedBuilder();

  GameStartedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tiles = $v.tiles;
      _speedPixelsPerSecond = $v.speedPixelsPerSecond;
      _gameDuration = $v.gameDuration;
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
            gameDuration: BuiltValueNullFieldError.checkNotNull(
                gameDuration, 'GameStarted', 'gameDuration'));
    replace(_$result);
    return _$result;
  }
}

class _$GameUpdated extends GameUpdated {
  @override
  final int tilesCount;
  @override
  final String songName;
  @override
  final double time;
  @override
  final int maxTime;

  factory _$GameUpdated([void Function(GameUpdatedBuilder)? updates]) =>
      (new GameUpdatedBuilder()..update(updates)).build();

  _$GameUpdated._(
      {required this.tilesCount,
      required this.songName,
      required this.time,
      required this.maxTime})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        tilesCount, 'GameUpdated', 'tilesCount');
    BuiltValueNullFieldError.checkNotNull(songName, 'GameUpdated', 'songName');
    BuiltValueNullFieldError.checkNotNull(time, 'GameUpdated', 'time');
    BuiltValueNullFieldError.checkNotNull(maxTime, 'GameUpdated', 'maxTime');
  }

  @override
  GameUpdated rebuild(void Function(GameUpdatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GameUpdatedBuilder toBuilder() => new GameUpdatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GameUpdated &&
        tilesCount == other.tilesCount &&
        songName == other.songName &&
        time == other.time &&
        maxTime == other.maxTime;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, tilesCount.hashCode), songName.hashCode), time.hashCode),
        maxTime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GameUpdated')
          ..add('tilesCount', tilesCount)
          ..add('songName', songName)
          ..add('time', time)
          ..add('maxTime', maxTime))
        .toString();
  }
}

class GameUpdatedBuilder implements Builder<GameUpdated, GameUpdatedBuilder> {
  _$GameUpdated? _$v;

  int? _tilesCount;
  int? get tilesCount => _$this._tilesCount;
  set tilesCount(int? tilesCount) => _$this._tilesCount = tilesCount;

  String? _songName;
  String? get songName => _$this._songName;
  set songName(String? songName) => _$this._songName = songName;

  double? _time;
  double? get time => _$this._time;
  set time(double? time) => _$this._time = time;

  int? _maxTime;
  int? get maxTime => _$this._maxTime;
  set maxTime(int? maxTime) => _$this._maxTime = maxTime;

  GameUpdatedBuilder();

  GameUpdatedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tilesCount = $v.tilesCount;
      _songName = $v.songName;
      _time = $v.time;
      _maxTime = $v.maxTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GameUpdated other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GameUpdated;
  }

  @override
  void update(void Function(GameUpdatedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GameUpdated build() {
    final _$result = _$v ??
        new _$GameUpdated._(
            tilesCount: BuiltValueNullFieldError.checkNotNull(
                tilesCount, 'GameUpdated', 'tilesCount'),
            songName: BuiltValueNullFieldError.checkNotNull(
                songName, 'GameUpdated', 'songName'),
            time: BuiltValueNullFieldError.checkNotNull(
                time, 'GameUpdated', 'time'),
            maxTime: BuiltValueNullFieldError.checkNotNull(
                maxTime, 'GameUpdated', 'maxTime'));
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

class _$GameNotLoaded extends GameNotLoaded {
  factory _$GameNotLoaded([void Function(GameNotLoadedBuilder)? updates]) =>
      (new GameNotLoadedBuilder()..update(updates)).build();

  _$GameNotLoaded._() : super._();

  @override
  GameNotLoaded rebuild(void Function(GameNotLoadedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GameNotLoadedBuilder toBuilder() => new GameNotLoadedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GameNotLoaded;
  }

  @override
  int get hashCode {
    return 988970491;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GameNotLoaded').toString();
  }
}

class GameNotLoadedBuilder
    implements Builder<GameNotLoaded, GameNotLoadedBuilder> {
  _$GameNotLoaded? _$v;

  GameNotLoadedBuilder();

  @override
  void replace(GameNotLoaded other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GameNotLoaded;
  }

  @override
  void update(void Function(GameNotLoadedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GameNotLoaded build() {
    final _$result = _$v ?? new _$GameNotLoaded._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
