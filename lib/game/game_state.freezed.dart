// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GameStateTearOff {
  const _$GameStateTearOff();

  GameStateLoading loading() {
    return GameStateLoading();
  }

  GameStatePlaying playing(int duration, String songName) {
    return GameStatePlaying(
      duration,
      songName,
    );
  }

  GameStateGettingGift gettingGift() {
    return GameStateGettingGift();
  }

  GameStateCompleted completed(GameReward gameReward) {
    return GameStateCompleted(
      gameReward,
    );
  }
}

/// @nodoc
const $GameState = _$GameStateTearOff();

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
      _$GameStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res> implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  final GameState _value;
  // ignore: unused_field
  final $Res Function(GameState) _then;
}

/// @nodoc
abstract class $GameStateLoadingCopyWith<$Res> {
  factory $GameStateLoadingCopyWith(
          GameStateLoading value, $Res Function(GameStateLoading) then) =
      _$GameStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$GameStateLoadingCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res>
    implements $GameStateLoadingCopyWith<$Res> {
  _$GameStateLoadingCopyWithImpl(
      GameStateLoading _value, $Res Function(GameStateLoading) _then)
      : super(_value, (v) => _then(v as GameStateLoading));

  @override
  GameStateLoading get _value => super._value as GameStateLoading;
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
    return identical(this, other) || (other is GameStateLoading);
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
abstract class $GameStatePlayingCopyWith<$Res> {
  factory $GameStatePlayingCopyWith(
          GameStatePlaying value, $Res Function(GameStatePlaying) then) =
      _$GameStatePlayingCopyWithImpl<$Res>;
  $Res call({int duration, String songName});
}

/// @nodoc
class _$GameStatePlayingCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res>
    implements $GameStatePlayingCopyWith<$Res> {
  _$GameStatePlayingCopyWithImpl(
      GameStatePlaying _value, $Res Function(GameStatePlaying) _then)
      : super(_value, (v) => _then(v as GameStatePlaying));

  @override
  GameStatePlaying get _value => super._value as GameStatePlaying;

  @override
  $Res call({
    Object? duration = freezed,
    Object? songName = freezed,
  }) {
    return _then(GameStatePlaying(
      duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      songName == freezed
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
        (other is GameStatePlaying &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.songName, songName) ||
                const DeepCollectionEquality()
                    .equals(other.songName, songName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(songName);

  @JsonKey(ignore: true)
  @override
  $GameStatePlayingCopyWith<GameStatePlaying> get copyWith =>
      _$GameStatePlayingCopyWithImpl<GameStatePlaying>(this, _$identity);

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
  factory GameStatePlaying(int duration, String songName) = _$GameStatePlaying;

  int get duration => throw _privateConstructorUsedError;
  String get songName => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameStatePlayingCopyWith<GameStatePlaying> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateGettingGiftCopyWith<$Res> {
  factory $GameStateGettingGiftCopyWith(GameStateGettingGift value,
          $Res Function(GameStateGettingGift) then) =
      _$GameStateGettingGiftCopyWithImpl<$Res>;
}

/// @nodoc
class _$GameStateGettingGiftCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res>
    implements $GameStateGettingGiftCopyWith<$Res> {
  _$GameStateGettingGiftCopyWithImpl(
      GameStateGettingGift _value, $Res Function(GameStateGettingGift) _then)
      : super(_value, (v) => _then(v as GameStateGettingGift));

  @override
  GameStateGettingGift get _value => super._value as GameStateGettingGift;
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
    return identical(this, other) || (other is GameStateGettingGift);
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
abstract class $GameStateCompletedCopyWith<$Res> {
  factory $GameStateCompletedCopyWith(
          GameStateCompleted value, $Res Function(GameStateCompleted) then) =
      _$GameStateCompletedCopyWithImpl<$Res>;
  $Res call({GameReward gameReward});

  $GameRewardCopyWith<$Res> get gameReward;
}

/// @nodoc
class _$GameStateCompletedCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res>
    implements $GameStateCompletedCopyWith<$Res> {
  _$GameStateCompletedCopyWithImpl(
      GameStateCompleted _value, $Res Function(GameStateCompleted) _then)
      : super(_value, (v) => _then(v as GameStateCompleted));

  @override
  GameStateCompleted get _value => super._value as GameStateCompleted;

  @override
  $Res call({
    Object? gameReward = freezed,
  }) {
    return _then(GameStateCompleted(
      gameReward == freezed
          ? _value.gameReward
          : gameReward // ignore: cast_nullable_to_non_nullable
              as GameReward,
    ));
  }

  @override
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
        (other is GameStateCompleted &&
            (identical(other.gameReward, gameReward) ||
                const DeepCollectionEquality()
                    .equals(other.gameReward, gameReward)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(gameReward);

  @JsonKey(ignore: true)
  @override
  $GameStateCompletedCopyWith<GameStateCompleted> get copyWith =>
      _$GameStateCompletedCopyWithImpl<GameStateCompleted>(this, _$identity);

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
  factory GameStateCompleted(GameReward gameReward) = _$GameStateCompleted;

  GameReward get gameReward => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameStateCompletedCopyWith<GameStateCompleted> get copyWith =>
      throw _privateConstructorUsedError;
}
