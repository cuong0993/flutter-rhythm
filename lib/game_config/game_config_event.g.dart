// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_config_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GameConfigChangeDifficultyEvent
    extends GameConfigChangeDifficultyEvent {
  @override
  final int difficulty;

  factory _$GameConfigChangeDifficultyEvent(
          [void Function(GameConfigChangeDifficultyEventBuilder)? updates]) =>
      (new GameConfigChangeDifficultyEventBuilder()..update(updates)).build();

  _$GameConfigChangeDifficultyEvent._({required this.difficulty}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        difficulty, 'GameConfigChangeDifficultyEvent', 'difficulty');
  }

  @override
  GameConfigChangeDifficultyEvent rebuild(
          void Function(GameConfigChangeDifficultyEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GameConfigChangeDifficultyEventBuilder toBuilder() =>
      new GameConfigChangeDifficultyEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GameConfigChangeDifficultyEvent &&
        difficulty == other.difficulty;
  }

  @override
  int get hashCode {
    return $jf($jc(0, difficulty.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GameConfigChangeDifficultyEvent')
          ..add('difficulty', difficulty))
        .toString();
  }
}

class GameConfigChangeDifficultyEventBuilder
    implements
        Builder<GameConfigChangeDifficultyEvent,
            GameConfigChangeDifficultyEventBuilder> {
  _$GameConfigChangeDifficultyEvent? _$v;

  int? _difficulty;
  int? get difficulty => _$this._difficulty;
  set difficulty(int? difficulty) => _$this._difficulty = difficulty;

  GameConfigChangeDifficultyEventBuilder();

  GameConfigChangeDifficultyEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _difficulty = $v.difficulty;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GameConfigChangeDifficultyEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GameConfigChangeDifficultyEvent;
  }

  @override
  void update(void Function(GameConfigChangeDifficultyEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GameConfigChangeDifficultyEvent build() {
    final _$result = _$v ??
        new _$GameConfigChangeDifficultyEvent._(
            difficulty: BuiltValueNullFieldError.checkNotNull(
                difficulty, 'GameConfigChangeDifficultyEvent', 'difficulty'));
    replace(_$result);
    return _$result;
  }
}

class _$GameConfigChangeSpeedEvent extends GameConfigChangeSpeedEvent {
  @override
  final int speed;

  factory _$GameConfigChangeSpeedEvent(
          [void Function(GameConfigChangeSpeedEventBuilder)? updates]) =>
      (new GameConfigChangeSpeedEventBuilder()..update(updates)).build();

  _$GameConfigChangeSpeedEvent._({required this.speed}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        speed, 'GameConfigChangeSpeedEvent', 'speed');
  }

  @override
  GameConfigChangeSpeedEvent rebuild(
          void Function(GameConfigChangeSpeedEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GameConfigChangeSpeedEventBuilder toBuilder() =>
      new GameConfigChangeSpeedEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GameConfigChangeSpeedEvent && speed == other.speed;
  }

  @override
  int get hashCode {
    return $jf($jc(0, speed.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GameConfigChangeSpeedEvent')
          ..add('speed', speed))
        .toString();
  }
}

class GameConfigChangeSpeedEventBuilder
    implements
        Builder<GameConfigChangeSpeedEvent, GameConfigChangeSpeedEventBuilder> {
  _$GameConfigChangeSpeedEvent? _$v;

  int? _speed;
  int? get speed => _$this._speed;
  set speed(int? speed) => _$this._speed = speed;

  GameConfigChangeSpeedEventBuilder();

  GameConfigChangeSpeedEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _speed = $v.speed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GameConfigChangeSpeedEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GameConfigChangeSpeedEvent;
  }

  @override
  void update(void Function(GameConfigChangeSpeedEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GameConfigChangeSpeedEvent build() {
    final _$result = _$v ??
        new _$GameConfigChangeSpeedEvent._(
            speed: BuiltValueNullFieldError.checkNotNull(
                speed, 'GameConfigChangeSpeedEvent', 'speed'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
