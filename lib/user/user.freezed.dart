// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  int get playedNotes => throw _privateConstructorUsedError;
  int get stars => throw _privateConstructorUsedError;
  Duration get playedTime => throw _privateConstructorUsedError;
  String get instrumentId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  bool get anonymous => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get creationTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      int playedNotes,
      int stars,
      Duration playedTime,
      String instrumentId,
      String name,
      String photoUrl,
      bool anonymous,
      @TimestampConverter() DateTime creationTime});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? playedNotes = null,
    Object? stars = null,
    Object? playedTime = null,
    Object? instrumentId = null,
    Object? name = null,
    Object? photoUrl = null,
    Object? anonymous = null,
    Object? creationTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      playedNotes: null == playedNotes
          ? _value.playedNotes
          : playedNotes // ignore: cast_nullable_to_non_nullable
              as int,
      stars: null == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      playedTime: null == playedTime
          ? _value.playedTime
          : playedTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      instrumentId: null == instrumentId
          ? _value.instrumentId
          : instrumentId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      anonymous: null == anonymous
          ? _value.anonymous
          : anonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      creationTime: null == creationTime
          ? _value.creationTime
          : creationTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int playedNotes,
      int stars,
      Duration playedTime,
      String instrumentId,
      String name,
      String photoUrl,
      bool anonymous,
      @TimestampConverter() DateTime creationTime});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? playedNotes = null,
    Object? stars = null,
    Object? playedTime = null,
    Object? instrumentId = null,
    Object? name = null,
    Object? photoUrl = null,
    Object? anonymous = null,
    Object? creationTime = null,
  }) {
    return _then(_$_User(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      playedNotes: null == playedNotes
          ? _value.playedNotes
          : playedNotes // ignore: cast_nullable_to_non_nullable
              as int,
      stars: null == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      playedTime: null == playedTime
          ? _value.playedTime
          : playedTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      instrumentId: null == instrumentId
          ? _value.instrumentId
          : instrumentId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      anonymous: null == anonymous
          ? _value.anonymous
          : anonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      creationTime: null == creationTime
          ? _value.creationTime
          : creationTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  _$_User(
      {required this.id,
      required this.playedNotes,
      required this.stars,
      required this.playedTime,
      required this.instrumentId,
      required this.name,
      required this.photoUrl,
      required this.anonymous,
      @TimestampConverter() required this.creationTime});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String id;
  @override
  final int playedNotes;
  @override
  final int stars;
  @override
  final Duration playedTime;
  @override
  final String instrumentId;
  @override
  final String name;
  @override
  final String photoUrl;
  @override
  final bool anonymous;
  @override
  @TimestampConverter()
  final DateTime creationTime;

  @override
  String toString() {
    return 'User(id: $id, playedNotes: $playedNotes, stars: $stars, playedTime: $playedTime, instrumentId: $instrumentId, name: $name, photoUrl: $photoUrl, anonymous: $anonymous, creationTime: $creationTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.playedNotes, playedNotes) ||
                other.playedNotes == playedNotes) &&
            (identical(other.stars, stars) || other.stars == stars) &&
            (identical(other.playedTime, playedTime) ||
                other.playedTime == playedTime) &&
            (identical(other.instrumentId, instrumentId) ||
                other.instrumentId == instrumentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.anonymous, anonymous) ||
                other.anonymous == anonymous) &&
            (identical(other.creationTime, creationTime) ||
                other.creationTime == creationTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, playedNotes, stars,
      playedTime, instrumentId, name, photoUrl, anonymous, creationTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User(
      {required final String id,
      required final int playedNotes,
      required final int stars,
      required final Duration playedTime,
      required final String instrumentId,
      required final String name,
      required final String photoUrl,
      required final bool anonymous,
      @TimestampConverter() required final DateTime creationTime}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id;
  @override
  int get playedNotes;
  @override
  int get stars;
  @override
  Duration get playedTime;
  @override
  String get instrumentId;
  @override
  String get name;
  @override
  String get photoUrl;
  @override
  bool get anonymous;
  @override
  @TimestampConverter()
  DateTime get creationTime;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
