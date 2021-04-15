// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_config_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GameConfigState extends GameConfigState {
  @override
  final int difficulty;
  @override
  final int speed;

  factory _$GameConfigState([void Function(GameConfigStateBuilder)? updates]) =>
      (new GameConfigStateBuilder()..update(updates)).build();

  _$GameConfigState._({required this.difficulty, required this.speed})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        difficulty, 'GameConfigState', 'difficulty');
    BuiltValueNullFieldError.checkNotNull(speed, 'GameConfigState', 'speed');
  }

  @override
  GameConfigState rebuild(void Function(GameConfigStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GameConfigStateBuilder toBuilder() =>
      new GameConfigStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GameConfigState &&
        difficulty == other.difficulty &&
        speed == other.speed;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, difficulty.hashCode), speed.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GameConfigState')
          ..add('difficulty', difficulty)
          ..add('speed', speed))
        .toString();
  }
}

class GameConfigStateBuilder
    implements Builder<GameConfigState, GameConfigStateBuilder> {
  _$GameConfigState? _$v;

  int? _difficulty;
  int? get difficulty => _$this._difficulty;
  set difficulty(int? difficulty) => _$this._difficulty = difficulty;

  int? _speed;
  int? get speed => _$this._speed;
  set speed(int? speed) => _$this._speed = speed;

  GameConfigStateBuilder();

  GameConfigStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _difficulty = $v.difficulty;
      _speed = $v.speed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GameConfigState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GameConfigState;
  }

  @override
  void update(void Function(GameConfigStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GameConfigState build() {
    final _$result = _$v ??
        new _$GameConfigState._(
            difficulty: BuiltValueNullFieldError.checkNotNull(
                difficulty, 'GameConfigState', 'difficulty'),
            speed: BuiltValueNullFieldError.checkNotNull(
                speed, 'GameConfigState', 'speed'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
