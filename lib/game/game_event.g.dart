// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StartGame extends StartGame {
  @override
  final Song song;
  @override
  final int difficulty;
  @override
  final int speed;

  factory _$StartGame([void Function(StartGameBuilder)? updates]) =>
      (new StartGameBuilder()..update(updates)).build();

  _$StartGame._(
      {required this.song, required this.difficulty, required this.speed})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(song, 'StartGame', 'song');
    BuiltValueNullFieldError.checkNotNull(
        difficulty, 'StartGame', 'difficulty');
    BuiltValueNullFieldError.checkNotNull(speed, 'StartGame', 'speed');
  }

  @override
  StartGame rebuild(void Function(StartGameBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StartGameBuilder toBuilder() => new StartGameBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StartGame &&
        song == other.song &&
        difficulty == other.difficulty &&
        speed == other.speed;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, song.hashCode), difficulty.hashCode), speed.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StartGame')
          ..add('song', song)
          ..add('difficulty', difficulty)
          ..add('speed', speed))
        .toString();
  }
}

class StartGameBuilder implements Builder<StartGame, StartGameBuilder> {
  _$StartGame? _$v;

  SongBuilder? _song;
  SongBuilder get song => _$this._song ??= new SongBuilder();
  set song(SongBuilder? song) => _$this._song = song;

  int? _difficulty;
  int? get difficulty => _$this._difficulty;
  set difficulty(int? difficulty) => _$this._difficulty = difficulty;

  int? _speed;
  int? get speed => _$this._speed;
  set speed(int? speed) => _$this._speed = speed;

  StartGameBuilder();

  StartGameBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _song = $v.song.toBuilder();
      _difficulty = $v.difficulty;
      _speed = $v.speed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StartGame other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StartGame;
  }

  @override
  void update(void Function(StartGameBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StartGame build() {
    _$StartGame _$result;
    try {
      _$result = _$v ??
          new _$StartGame._(
              song: song.build(),
              difficulty: BuiltValueNullFieldError.checkNotNull(
                  difficulty, 'StartGame', 'difficulty'),
              speed: BuiltValueNullFieldError.checkNotNull(
                  speed, 'StartGame', 'speed'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'song';
        song.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'StartGame', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$RestartGame extends RestartGame {
  @override
  final String type;

  factory _$RestartGame([void Function(RestartGameBuilder)? updates]) =>
      (new RestartGameBuilder()..update(updates)).build();

  _$RestartGame._({required this.type}) : super._() {
    BuiltValueNullFieldError.checkNotNull(type, 'RestartGame', 'type');
  }

  @override
  RestartGame rebuild(void Function(RestartGameBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RestartGameBuilder toBuilder() => new RestartGameBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RestartGame && type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc(0, type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RestartGame')..add('type', type))
        .toString();
  }
}

class RestartGameBuilder implements Builder<RestartGame, RestartGameBuilder> {
  _$RestartGame? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  RestartGameBuilder();

  RestartGameBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RestartGame other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RestartGame;
  }

  @override
  void update(void Function(RestartGameBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RestartGame build() {
    final _$result = _$v ??
        new _$RestartGame._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, 'RestartGame', 'type'));
    replace(_$result);
    return _$result;
  }
}

class _$PauseGame extends PauseGame {
  @override
  final String type;

  factory _$PauseGame([void Function(PauseGameBuilder)? updates]) =>
      (new PauseGameBuilder()..update(updates)).build();

  _$PauseGame._({required this.type}) : super._() {
    BuiltValueNullFieldError.checkNotNull(type, 'PauseGame', 'type');
  }

  @override
  PauseGame rebuild(void Function(PauseGameBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PauseGameBuilder toBuilder() => new PauseGameBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PauseGame && type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc(0, type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PauseGame')..add('type', type))
        .toString();
  }
}

class PauseGameBuilder implements Builder<PauseGame, PauseGameBuilder> {
  _$PauseGame? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  PauseGameBuilder();

  PauseGameBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PauseGame other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PauseGame;
  }

  @override
  void update(void Function(PauseGameBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PauseGame build() {
    final _$result = _$v ??
        new _$PauseGame._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, 'PauseGame', 'type'));
    replace(_$result);
    return _$result;
  }
}

class _$CompleteGame extends CompleteGame {
  @override
  final String type;

  factory _$CompleteGame([void Function(CompleteGameBuilder)? updates]) =>
      (new CompleteGameBuilder()..update(updates)).build();

  _$CompleteGame._({required this.type}) : super._() {
    BuiltValueNullFieldError.checkNotNull(type, 'CompleteGame', 'type');
  }

  @override
  CompleteGame rebuild(void Function(CompleteGameBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompleteGameBuilder toBuilder() => new CompleteGameBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompleteGame && type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc(0, type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CompleteGame')..add('type', type))
        .toString();
  }
}

class CompleteGameBuilder
    implements Builder<CompleteGame, CompleteGameBuilder> {
  _$CompleteGame? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  CompleteGameBuilder();

  CompleteGameBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompleteGame other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompleteGame;
  }

  @override
  void update(void Function(CompleteGameBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CompleteGame build() {
    final _$result = _$v ??
        new _$CompleteGame._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, 'CompleteGame', 'type'));
    replace(_$result);
    return _$result;
  }
}

class _$TileTouched extends TileTouched {
  @override
  final Tile? tile;

  factory _$TileTouched([void Function(TileTouchedBuilder)? updates]) =>
      (new TileTouchedBuilder()..update(updates)).build();

  _$TileTouched._({this.tile}) : super._();

  @override
  TileTouched rebuild(void Function(TileTouchedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TileTouchedBuilder toBuilder() => new TileTouchedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TileTouched && tile == other.tile;
  }

  @override
  int get hashCode {
    return $jf($jc(0, tile.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TileTouched')..add('tile', tile))
        .toString();
  }
}

class TileTouchedBuilder implements Builder<TileTouched, TileTouchedBuilder> {
  _$TileTouched? _$v;

  Tile? _tile;
  Tile? get tile => _$this._tile;
  set tile(Tile? tile) => _$this._tile = tile;

  TileTouchedBuilder();

  TileTouchedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tile = $v.tile;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TileTouched other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TileTouched;
  }

  @override
  void update(void Function(TileTouchedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TileTouched build() {
    final _$result = _$v ?? new _$TileTouched._(tile: tile);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
