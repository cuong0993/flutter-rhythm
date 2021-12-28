// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game_reward.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameReward _$GameRewardFromJson(Map<String, dynamic> json) {
  return _GameReward.fromJson(json);
}

/// @nodoc
class _$GameRewardTearOff {
  const _$GameRewardTearOff();

  _GameReward call({required int stars, required int playedNotes}) {
    return _GameReward(
      stars: stars,
      playedNotes: playedNotes,
    );
  }

  GameReward fromJson(Map<String, Object?> json) {
    return GameReward.fromJson(json);
  }
}

/// @nodoc
const $GameReward = _$GameRewardTearOff();

/// @nodoc
mixin _$GameReward {
  int get stars => throw _privateConstructorUsedError;
  int get playedNotes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameRewardCopyWith<GameReward> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameRewardCopyWith<$Res> {
  factory $GameRewardCopyWith(
          GameReward value, $Res Function(GameReward) then) =
      _$GameRewardCopyWithImpl<$Res>;
  $Res call({int stars, int playedNotes});
}

/// @nodoc
class _$GameRewardCopyWithImpl<$Res> implements $GameRewardCopyWith<$Res> {
  _$GameRewardCopyWithImpl(this._value, this._then);

  final GameReward _value;
  // ignore: unused_field
  final $Res Function(GameReward) _then;

  @override
  $Res call({
    Object? stars = freezed,
    Object? playedNotes = freezed,
  }) {
    return _then(_value.copyWith(
      stars: stars == freezed
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      playedNotes: playedNotes == freezed
          ? _value.playedNotes
          : playedNotes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$GameRewardCopyWith<$Res> implements $GameRewardCopyWith<$Res> {
  factory _$GameRewardCopyWith(
          _GameReward value, $Res Function(_GameReward) then) =
      __$GameRewardCopyWithImpl<$Res>;
  @override
  $Res call({int stars, int playedNotes});
}

/// @nodoc
class __$GameRewardCopyWithImpl<$Res> extends _$GameRewardCopyWithImpl<$Res>
    implements _$GameRewardCopyWith<$Res> {
  __$GameRewardCopyWithImpl(
      _GameReward _value, $Res Function(_GameReward) _then)
      : super(_value, (v) => _then(v as _GameReward));

  @override
  _GameReward get _value => super._value as _GameReward;

  @override
  $Res call({
    Object? stars = freezed,
    Object? playedNotes = freezed,
  }) {
    return _then(_GameReward(
      stars: stars == freezed
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      playedNotes: playedNotes == freezed
          ? _value.playedNotes
          : playedNotes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameReward implements _GameReward {
  _$_GameReward({required this.stars, required this.playedNotes});

  factory _$_GameReward.fromJson(Map<String, dynamic> json) =>
      _$$_GameRewardFromJson(json);

  @override
  final int stars;
  @override
  final int playedNotes;

  @override
  String toString() {
    return 'GameReward(stars: $stars, playedNotes: $playedNotes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameReward &&
            const DeepCollectionEquality().equals(other.stars, stars) &&
            const DeepCollectionEquality()
                .equals(other.playedNotes, playedNotes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(stars),
      const DeepCollectionEquality().hash(playedNotes));

  @JsonKey(ignore: true)
  @override
  _$GameRewardCopyWith<_GameReward> get copyWith =>
      __$GameRewardCopyWithImpl<_GameReward>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameRewardToJson(this);
  }
}

abstract class _GameReward implements GameReward {
  factory _GameReward({required int stars, required int playedNotes}) =
      _$_GameReward;

  factory _GameReward.fromJson(Map<String, dynamic> json) =
      _$_GameReward.fromJson;

  @override
  int get stars;
  @override
  int get playedNotes;
  @override
  @JsonKey(ignore: true)
  _$GameRewardCopyWith<_GameReward> get copyWith =>
      throw _privateConstructorUsedError;
}
