// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'song.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Song _$SongFromJson(Map<String, dynamic> json) {
  return _Song.fromJson(json);
}

/// @nodoc
class _$SongTearOff {
  const _$SongTearOff();

  _Song call(
      String id,
      String title,
      String artist,
      String url,
      int bpm,
      int unitDuration,
      List<int> tilesCount,
      List<int> duration,
      List<String> tags) {
    return _Song(
      id,
      title,
      artist,
      url,
      bpm,
      unitDuration,
      tilesCount,
      duration,
      tags,
    );
  }

  Song fromJson(Map<String, Object> json) {
    return Song.fromJson(json);
  }
}

/// @nodoc
const $Song = _$SongTearOff();

/// @nodoc
mixin _$Song {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get artist => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  int get bpm => throw _privateConstructorUsedError;
  int get unitDuration => throw _privateConstructorUsedError;
  List<int> get tilesCount => throw _privateConstructorUsedError;
  List<int> get duration => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongCopyWith<Song> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongCopyWith<$Res> {
  factory $SongCopyWith(Song value, $Res Function(Song) then) =
      _$SongCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      String artist,
      String url,
      int bpm,
      int unitDuration,
      List<int> tilesCount,
      List<int> duration,
      List<String> tags});
}

/// @nodoc
class _$SongCopyWithImpl<$Res> implements $SongCopyWith<$Res> {
  _$SongCopyWithImpl(this._value, this._then);

  final Song _value;
  // ignore: unused_field
  final $Res Function(Song) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? artist = freezed,
    Object? url = freezed,
    Object? bpm = freezed,
    Object? unitDuration = freezed,
    Object? tilesCount = freezed,
    Object? duration = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: artist == freezed
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      bpm: bpm == freezed
          ? _value.bpm
          : bpm // ignore: cast_nullable_to_non_nullable
              as int,
      unitDuration: unitDuration == freezed
          ? _value.unitDuration
          : unitDuration // ignore: cast_nullable_to_non_nullable
              as int,
      tilesCount: tilesCount == freezed
          ? _value.tilesCount
          : tilesCount // ignore: cast_nullable_to_non_nullable
              as List<int>,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as List<int>,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$SongCopyWith<$Res> implements $SongCopyWith<$Res> {
  factory _$SongCopyWith(_Song value, $Res Function(_Song) then) =
      __$SongCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String artist,
      String url,
      int bpm,
      int unitDuration,
      List<int> tilesCount,
      List<int> duration,
      List<String> tags});
}

/// @nodoc
class __$SongCopyWithImpl<$Res> extends _$SongCopyWithImpl<$Res>
    implements _$SongCopyWith<$Res> {
  __$SongCopyWithImpl(_Song _value, $Res Function(_Song) _then)
      : super(_value, (v) => _then(v as _Song));

  @override
  _Song get _value => super._value as _Song;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? artist = freezed,
    Object? url = freezed,
    Object? bpm = freezed,
    Object? unitDuration = freezed,
    Object? tilesCount = freezed,
    Object? duration = freezed,
    Object? tags = freezed,
  }) {
    return _then(_Song(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist == freezed
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      bpm == freezed
          ? _value.bpm
          : bpm // ignore: cast_nullable_to_non_nullable
              as int,
      unitDuration == freezed
          ? _value.unitDuration
          : unitDuration // ignore: cast_nullable_to_non_nullable
              as int,
      tilesCount == freezed
          ? _value.tilesCount
          : tilesCount // ignore: cast_nullable_to_non_nullable
              as List<int>,
      duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as List<int>,
      tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Song implements _Song {
  _$_Song(this.id, this.title, this.artist, this.url, this.bpm,
      this.unitDuration, this.tilesCount, this.duration, this.tags);

  factory _$_Song.fromJson(Map<String, dynamic> json) =>
      _$_$_SongFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String artist;
  @override
  final String url;
  @override
  final int bpm;
  @override
  final int unitDuration;
  @override
  final List<int> tilesCount;
  @override
  final List<int> duration;
  @override
  final List<String> tags;

  @override
  String toString() {
    return 'Song(id: $id, title: $title, artist: $artist, url: $url, bpm: $bpm, unitDuration: $unitDuration, tilesCount: $tilesCount, duration: $duration, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Song &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.artist, artist) ||
                const DeepCollectionEquality().equals(other.artist, artist)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.bpm, bpm) ||
                const DeepCollectionEquality().equals(other.bpm, bpm)) &&
            (identical(other.unitDuration, unitDuration) ||
                const DeepCollectionEquality()
                    .equals(other.unitDuration, unitDuration)) &&
            (identical(other.tilesCount, tilesCount) ||
                const DeepCollectionEquality()
                    .equals(other.tilesCount, tilesCount)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(artist) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(bpm) ^
      const DeepCollectionEquality().hash(unitDuration) ^
      const DeepCollectionEquality().hash(tilesCount) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(tags);

  @JsonKey(ignore: true)
  @override
  _$SongCopyWith<_Song> get copyWith =>
      __$SongCopyWithImpl<_Song>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SongToJson(this);
  }
}

abstract class _Song implements Song {
  factory _Song(
      String id,
      String title,
      String artist,
      String url,
      int bpm,
      int unitDuration,
      List<int> tilesCount,
      List<int> duration,
      List<String> tags) = _$_Song;

  factory _Song.fromJson(Map<String, dynamic> json) = _$_Song.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get artist => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  int get bpm => throw _privateConstructorUsedError;
  @override
  int get unitDuration => throw _privateConstructorUsedError;
  @override
  List<int> get tilesCount => throw _privateConstructorUsedError;
  @override
  List<int> get duration => throw _privateConstructorUsedError;
  @override
  List<String> get tags => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SongCopyWith<_Song> get copyWith => throw _privateConstructorUsedError;
}
