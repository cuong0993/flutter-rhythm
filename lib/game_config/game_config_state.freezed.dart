// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_config_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$GameConfigStateCopyWithImpl<$Res, GameConfigState>;
  @useResult
  $Res call({int difficulty, int speed});
}

/// @nodoc
class _$GameConfigStateCopyWithImpl<$Res, $Val extends GameConfigState>
    implements $GameConfigStateCopyWith<$Res> {
  _$GameConfigStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? difficulty = null,
    Object? speed = null,
  }) {
    return _then(_value.copyWith(
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameConfigStateCopyWith<$Res>
    implements $GameConfigStateCopyWith<$Res> {
  factory _$$_GameConfigStateCopyWith(
          _$_GameConfigState value, $Res Function(_$_GameConfigState) then) =
      __$$_GameConfigStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int difficulty, int speed});
}

/// @nodoc
class __$$_GameConfigStateCopyWithImpl<$Res>
    extends _$GameConfigStateCopyWithImpl<$Res, _$_GameConfigState>
    implements _$$_GameConfigStateCopyWith<$Res> {
  __$$_GameConfigStateCopyWithImpl(
      _$_GameConfigState _value, $Res Function(_$_GameConfigState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? difficulty = null,
    Object? speed = null,
  }) {
    return _then(_$_GameConfigState(
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      speed: null == speed
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
            other is _$_GameConfigState &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.speed, speed) || other.speed == speed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, difficulty, speed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameConfigStateCopyWith<_$_GameConfigState> get copyWith =>
      __$$_GameConfigStateCopyWithImpl<_$_GameConfigState>(this, _$identity);
}

abstract class _GameConfigState implements GameConfigState {
  factory _GameConfigState(
      {required final int difficulty,
      required final int speed}) = _$_GameConfigState;

  @override
  int get difficulty;
  @override
  int get speed;
  @override
  @JsonKey(ignore: true)
  _$$_GameConfigStateCopyWith<_$_GameConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}
