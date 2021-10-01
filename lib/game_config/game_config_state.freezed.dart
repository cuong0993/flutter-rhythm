// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game_config_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GameConfigStateTearOff {
  const _$GameConfigStateTearOff();

  _GameConfigState call({required int difficulty, required int speed}) {
    return _GameConfigState(
      difficulty: difficulty,
      speed: speed,
    );
  }
}

/// @nodoc
const $GameConfigState = _$GameConfigStateTearOff();

/// @nodoc
mixin _$GameConfigState {
  int get difficulty => throw _privateConstructorUsedError;
  int get speed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameConfigStateCopyWith<GameConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameConfigStateCopyWith<$Res> {
  factory $GameConfigStateCopyWith(
          GameConfigState value, $Res Function(GameConfigState) then) =
      _$GameConfigStateCopyWithImpl<$Res>;
  $Res call({int difficulty, int speed});
}

/// @nodoc
class _$GameConfigStateCopyWithImpl<$Res>
    implements $GameConfigStateCopyWith<$Res> {
  _$GameConfigStateCopyWithImpl(this._value, this._then);

  final GameConfigState _value;
  // ignore: unused_field
  final $Res Function(GameConfigState) _then;

  @override
  $Res call({
    Object? difficulty = freezed,
    Object? speed = freezed,
  }) {
    return _then(_value.copyWith(
      difficulty: difficulty == freezed
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      speed: speed == freezed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$GameConfigStateCopyWith<$Res>
    implements $GameConfigStateCopyWith<$Res> {
  factory _$GameConfigStateCopyWith(
          _GameConfigState value, $Res Function(_GameConfigState) then) =
      __$GameConfigStateCopyWithImpl<$Res>;
  @override
  $Res call({int difficulty, int speed});
}

/// @nodoc
class __$GameConfigStateCopyWithImpl<$Res>
    extends _$GameConfigStateCopyWithImpl<$Res>
    implements _$GameConfigStateCopyWith<$Res> {
  __$GameConfigStateCopyWithImpl(
      _GameConfigState _value, $Res Function(_GameConfigState) _then)
      : super(_value, (v) => _then(v as _GameConfigState));

  @override
  _GameConfigState get _value => super._value as _GameConfigState;

  @override
  $Res call({
    Object? difficulty = freezed,
    Object? speed = freezed,
  }) {
    return _then(_GameConfigState(
      difficulty: difficulty == freezed
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      speed: speed == freezed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GameConfigState implements _GameConfigState {
  _$_GameConfigState({required this.difficulty, required this.speed});

  @override
  final int difficulty;
  @override
  final int speed;

  @override
  String toString() {
    return 'GameConfigState(difficulty: $difficulty, speed: $speed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameConfigState &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.speed, speed) || other.speed == speed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, difficulty, speed);

  @JsonKey(ignore: true)
  @override
  _$GameConfigStateCopyWith<_GameConfigState> get copyWith =>
      __$GameConfigStateCopyWithImpl<_GameConfigState>(this, _$identity);
}

abstract class _GameConfigState implements GameConfigState {
  factory _GameConfigState({required int difficulty, required int speed}) =
      _$_GameConfigState;

  @override
  int get difficulty;
  @override
  int get speed;
  @override
  @JsonKey(ignore: true)
  _$GameConfigStateCopyWith<_GameConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}
