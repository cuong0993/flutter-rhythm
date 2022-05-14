// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int duration, String songName) playing,
    required TResult Function() gettingGift,
    required TResult Function(GameReward gameReward) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int duration, String songName)? playing,
    TResult? Function()? gettingGift,
    TResult? Function(GameReward gameReward)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int duration, String songName)? playing,
    TResult Function()? gettingGift,
    TResult Function(GameReward gameReward)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameStateLoading value) loading,
    required TResult Function(GameStatePlaying value) playing,
    required TResult Function(GameStateGettingGift value) gettingGift,
    required TResult Function(GameStateCompleted value) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GameStateLoading value)? loading,
    TResult? Function(GameStatePlaying value)? playing,
    TResult? Function(GameStateGettingGift value)? gettingGift,
    TResult? Function(GameStateCompleted value)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameStateLoading value)? loading,
    TResult Function(GameStatePlaying value)? playing,
    TResult Function(GameStateGettingGift value)? gettingGift,
    TResult Function(GameStateCompleted value)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GameStateLoadingCopyWith<$Res> {
  factory _$$GameStateLoadingCopyWith(
          _$GameStateLoading value, $Res Function(_$GameStateLoading) then) =
      __$$GameStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GameStateLoadingCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateLoading>
    implements _$$GameStateLoadingCopyWith<$Res> {
  __$$GameStateLoadingCopyWithImpl(
      _$GameStateLoading _value, $Res Function(_$GameStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GameStateLoading implements GameStateLoading {
  _$GameStateLoading();

  @override
  String toString() {
    return 'GameState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GameStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int duration, String songName) playing,
    required TResult Function() gettingGift,
    required TResult Function(GameReward gameReward) completed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int duration, String songName)? playing,
    TResult? Function()? gettingGift,
    TResult? Function(GameReward gameReward)? completed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int duration, String songName)? playing,
    TResult Function()? gettingGift,
    TResult Function(GameReward gameReward)? completed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameStateLoading value) loading,
    required TResult Function(GameStatePlaying value) playing,
    required TResult Function(GameStateGettingGift value) gettingGift,
    required TResult Function(GameStateCompleted value) completed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GameStateLoading value)? loading,
    TResult? Function(GameStatePlaying value)? playing,
    TResult? Function(GameStateGettingGift value)? gettingGift,
    TResult? Function(GameStateCompleted value)? completed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameStateLoading value)? loading,
    TResult Function(GameStatePlaying value)? playing,
    TResult Function(GameStateGettingGift value)? gettingGift,
    TResult Function(GameStateCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GameStateLoading implements GameState {
  factory GameStateLoading() = _$GameStateLoading;
}

/// @nodoc
abstract class _$$GameStatePlayingCopyWith<$Res> {
  factory _$$GameStatePlayingCopyWith(
          _$GameStatePlaying value, $Res Function(_$GameStatePlaying) then) =
      __$$GameStatePlayingCopyWithImpl<$Res>;
  @useResult
  $Res call({int duration, String songName});
}

/// @nodoc
class __$$GameStatePlayingCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStatePlaying>
    implements _$$GameStatePlayingCopyWith<$Res> {
  __$$GameStatePlayingCopyWithImpl(
      _$GameStatePlaying _value, $Res Function(_$GameStatePlaying) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? songName = null,
  }) {
    return _then(_$GameStatePlaying(
      null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      null == songName
          ? _value.songName
          : songName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GameStatePlaying implements GameStatePlaying {
  _$GameStatePlaying(this.duration, this.songName);

  @override
  final int duration;
  @override
  final String songName;

  @override
  String toString() {
    return 'GameState.playing(duration: $duration, songName: $songName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStatePlaying &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.songName, songName) ||
                other.songName == songName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, songName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStatePlayingCopyWith<_$GameStatePlaying> get copyWith =>
      __$$GameStatePlayingCopyWithImpl<_$GameStatePlaying>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int duration, String songName) playing,
    required TResult Function() gettingGift,
    required TResult Function(GameReward gameReward) completed,
  }) {
    return playing(duration, songName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int duration, String songName)? playing,
    TResult? Function()? gettingGift,
    TResult? Function(GameReward gameReward)? completed,
  }) {
    return playing?.call(duration, songName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int duration, String songName)? playing,
    TResult Function()? gettingGift,
    TResult Function(GameReward gameReward)? completed,
    required TResult orElse(),
  }) {
    if (playing != null) {
      return playing(duration, songName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameStateLoading value) loading,
    required TResult Function(GameStatePlaying value) playing,
    required TResult Function(GameStateGettingGift value) gettingGift,
    required TResult Function(GameStateCompleted value) completed,
  }) {
    return playing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GameStateLoading value)? loading,
    TResult? Function(GameStatePlaying value)? playing,
    TResult? Function(GameStateGettingGift value)? gettingGift,
    TResult? Function(GameStateCompleted value)? completed,
  }) {
    return playing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameStateLoading value)? loading,
    TResult Function(GameStatePlaying value)? playing,
    TResult Function(GameStateGettingGift value)? gettingGift,
    TResult Function(GameStateCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (playing != null) {
      return playing(this);
    }
    return orElse();
  }
}

abstract class GameStatePlaying implements GameState {
  factory GameStatePlaying(final int duration, final String songName) =
      _$GameStatePlaying;

  int get duration;
  String get songName;
  @JsonKey(ignore: true)
  _$$GameStatePlayingCopyWith<_$GameStatePlaying> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameStateGettingGiftCopyWith<$Res> {
  factory _$$GameStateGettingGiftCopyWith(_$GameStateGettingGift value,
          $Res Function(_$GameStateGettingGift) then) =
      __$$GameStateGettingGiftCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GameStateGettingGiftCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateGettingGift>
    implements _$$GameStateGettingGiftCopyWith<$Res> {
  __$$GameStateGettingGiftCopyWithImpl(_$GameStateGettingGift _value,
      $Res Function(_$GameStateGettingGift) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GameStateGettingGift implements GameStateGettingGift {
  _$GameStateGettingGift();

  @override
  String toString() {
    return 'GameState.gettingGift()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GameStateGettingGift);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int duration, String songName) playing,
    required TResult Function() gettingGift,
    required TResult Function(GameReward gameReward) completed,
  }) {
    return gettingGift();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int duration, String songName)? playing,
    TResult? Function()? gettingGift,
    TResult? Function(GameReward gameReward)? completed,
  }) {
    return gettingGift?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int duration, String songName)? playing,
    TResult Function()? gettingGift,
    TResult Function(GameReward gameReward)? completed,
    required TResult orElse(),
  }) {
    if (gettingGift != null) {
      return gettingGift();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameStateLoading value) loading,
    required TResult Function(GameStatePlaying value) playing,
    required TResult Function(GameStateGettingGift value) gettingGift,
    required TResult Function(GameStateCompleted value) completed,
  }) {
    return gettingGift(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GameStateLoading value)? loading,
    TResult? Function(GameStatePlaying value)? playing,
    TResult? Function(GameStateGettingGift value)? gettingGift,
    TResult? Function(GameStateCompleted value)? completed,
  }) {
    return gettingGift?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameStateLoading value)? loading,
    TResult Function(GameStatePlaying value)? playing,
    TResult Function(GameStateGettingGift value)? gettingGift,
    TResult Function(GameStateCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (gettingGift != null) {
      return gettingGift(this);
    }
    return orElse();
  }
}

abstract class GameStateGettingGift implements GameState {
  factory GameStateGettingGift() = _$GameStateGettingGift;
}

/// @nodoc
abstract class _$$GameStateCompletedCopyWith<$Res> {
  factory _$$GameStateCompletedCopyWith(_$GameStateCompleted value,
          $Res Function(_$GameStateCompleted) then) =
      __$$GameStateCompletedCopyWithImpl<$Res>;
  @useResult
  $Res call({GameReward gameReward});

  $GameRewardCopyWith<$Res> get gameReward;
}

/// @nodoc
class __$$GameStateCompletedCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateCompleted>
    implements _$$GameStateCompletedCopyWith<$Res> {
  __$$GameStateCompletedCopyWithImpl(
      _$GameStateCompleted _value, $Res Function(_$GameStateCompleted) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameReward = null,
  }) {
    return _then(_$GameStateCompleted(
      null == gameReward
          ? _value.gameReward
          : gameReward // ignore: cast_nullable_to_non_nullable
              as GameReward,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $GameRewardCopyWith<$Res> get gameReward {
    return $GameRewardCopyWith<$Res>(_value.gameReward, (value) {
      return _then(_value.copyWith(gameReward: value));
    });
  }
}

/// @nodoc

class _$GameStateCompleted implements GameStateCompleted {
  _$GameStateCompleted(this.gameReward);

  @override
  final GameReward gameReward;

  @override
  String toString() {
    return 'GameState.completed(gameReward: $gameReward)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateCompleted &&
            (identical(other.gameReward, gameReward) ||
                other.gameReward == gameReward));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gameReward);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateCompletedCopyWith<_$GameStateCompleted> get copyWith =>
      __$$GameStateCompletedCopyWithImpl<_$GameStateCompleted>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int duration, String songName) playing,
    required TResult Function() gettingGift,
    required TResult Function(GameReward gameReward) completed,
  }) {
    return completed(gameReward);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int duration, String songName)? playing,
    TResult? Function()? gettingGift,
    TResult? Function(GameReward gameReward)? completed,
  }) {
    return completed?.call(gameReward);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int duration, String songName)? playing,
    TResult Function()? gettingGift,
    TResult Function(GameReward gameReward)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(gameReward);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameStateLoading value) loading,
    required TResult Function(GameStatePlaying value) playing,
    required TResult Function(GameStateGettingGift value) gettingGift,
    required TResult Function(GameStateCompleted value) completed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GameStateLoading value)? loading,
    TResult? Function(GameStatePlaying value)? playing,
    TResult? Function(GameStateGettingGift value)? gettingGift,
    TResult? Function(GameStateCompleted value)? completed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameStateLoading value)? loading,
    TResult Function(GameStatePlaying value)? playing,
    TResult Function(GameStateGettingGift value)? gettingGift,
    TResult Function(GameStateCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class GameStateCompleted implements GameState {
  factory GameStateCompleted(final GameReward gameReward) =
      _$GameStateCompleted;

  GameReward get gameReward;
  @JsonKey(ignore: true)
  _$$GameStateCompletedCopyWith<_$GameStateCompleted> get copyWith =>
      throw _privateConstructorUsedError;
}
