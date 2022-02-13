// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required String id,
      required int playedNotes,
      required int stars,
      required Duration playedTime,
      required String instrumentId,
      required String name,
      required String photoUrl,
      required bool anonymous,
      @TimestampConverter() required DateTime creationTime}) {
    return _User(
      id: id,
      playedNotes: playedNotes,
      stars: stars,
      playedTime: playedTime,
      instrumentId: instrumentId,
      name: name,
      photoUrl: photoUrl,
      anonymous: anonymous,
      creationTime: creationTime,
    );
  }

  User fromJson(Map<String, Object?> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

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
      _$UserCopyWithImpl<$Res>;
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
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? playedNotes = freezed,
    Object? stars = freezed,
    Object? playedTime = freezed,
    Object? instrumentId = freezed,
    Object? name = freezed,
    Object? photoUrl = freezed,
    Object? anonymous = freezed,
    Object? creationTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      playedNotes: playedNotes == freezed
          ? _value.playedNotes
          : playedNotes // ignore: cast_nullable_to_non_nullable
              as int,
      stars: stars == freezed
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      playedTime: playedTime == freezed
          ? _value.playedTime
          : playedTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      instrumentId: instrumentId == freezed
          ? _value.instrumentId
          : instrumentId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      anonymous: anonymous == freezed
          ? _value.anonymous
          : anonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      creationTime: creationTime == freezed
          ? _value.creationTime
          : creationTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
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
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? playedNotes = freezed,
    Object? stars = freezed,
    Object? playedTime = freezed,
    Object? instrumentId = freezed,
    Object? name = freezed,
    Object? photoUrl = freezed,
    Object? anonymous = freezed,
    Object? creationTime = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      playedNotes: playedNotes == freezed
          ? _value.playedNotes
          : playedNotes // ignore: cast_nullable_to_non_nullable
              as int,
      stars: stars == freezed
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      playedTime: playedTime == freezed
          ? _value.playedTime
          : playedTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      instrumentId: instrumentId == freezed
          ? _value.instrumentId
          : instrumentId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      anonymous: anonymous == freezed
          ? _value.anonymous
          : anonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      creationTime: creationTime == freezed
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
            other is _User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.playedNotes, playedNotes) &&
            const DeepCollectionEquality().equals(other.stars, stars) &&
            const DeepCollectionEquality()
                .equals(other.playedTime, playedTime) &&
            const DeepCollectionEquality()
                .equals(other.instrumentId, instrumentId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.photoUrl, photoUrl) &&
            const DeepCollectionEquality().equals(other.anonymous, anonymous) &&
            const DeepCollectionEquality()
                .equals(other.creationTime, creationTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(playedNotes),
      const DeepCollectionEquality().hash(stars),
      const DeepCollectionEquality().hash(playedTime),
      const DeepCollectionEquality().hash(instrumentId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(photoUrl),
      const DeepCollectionEquality().hash(anonymous),
      const DeepCollectionEquality().hash(creationTime));

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User implements User {
  factory _User(
      {required String id,
      required int playedNotes,
      required int stars,
      required Duration playedTime,
      required String instrumentId,
      required String name,
      required String photoUrl,
      required bool anonymous,
      @TimestampConverter() required DateTime creationTime}) = _$_User;

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
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
