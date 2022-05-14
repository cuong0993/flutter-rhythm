// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_reward.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameReward _$GameRewardFromJson(Map<String, dynamic> json) {
  return _GameReward.fromJson(json);
}

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
      _$GameRewardCopyWithImpl<$Res, GameReward>;
  @useResult
  $Res call({int stars, int playedNotes});
}

/// @nodoc
class _$GameRewardCopyWithImpl<$Res, $Val extends GameReward>
    implements $GameRewardCopyWith<$Res> {
  _$GameRewardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stars = null,
    Object? playedNotes = null,
  }) {
    return _then(_value.copyWith(
      stars: null == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      playedNotes: null == playedNotes
          ? _value.playedNotes
          : playedNotes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameRewardCopyWith<$Res>
    implements $GameRewardCopyWith<$Res> {
  factory _$$_GameRewardCopyWith(
          _$_GameReward value, $Res Function(_$_GameReward) then) =
      __$$_GameRewardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int stars, int playedNotes});
}

/// @nodoc
class __$$_GameRewardCopyWithImpl<$Res>
    extends _$GameRewardCopyWithImpl<$Res, _$_GameReward>
    implements _$$_GameRewardCopyWith<$Res> {
  __$$_GameRewardCopyWithImpl(
      _$_GameReward _value, $Res Function(_$_GameReward) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stars = null,
    Object? playedNotes = null,
  }) {
    return _then(_$_GameReward(
      stars: null == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      playedNotes: null == playedNotes
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
            other is _$_GameReward &&
            (identical(other.stars, stars) || other.stars == stars) &&
            (identical(other.playedNotes, playedNotes) ||
                other.playedNotes == playedNotes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, stars, playedNotes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameRewardCopyWith<_$_GameReward> get copyWith =>
      __$$_GameRewardCopyWithImpl<_$_GameReward>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameRewardToJson(
      this,
    );
  }
}

abstract class _GameReward implements GameReward {
  factory _GameReward(
      {required final int stars,
      required final int playedNotes}) = _$_GameReward;

  factory _GameReward.fromJson(Map<String, dynamic> json) =
      _$_GameReward.fromJson;

  @override
  int get stars;
  @override
  int get playedNotes;
  @override
  @JsonKey(ignore: true)
  _$$_GameRewardCopyWith<_$_GameReward> get copyWith =>
      throw _privateConstructorUsedError;
}
