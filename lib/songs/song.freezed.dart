// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Song _$SongFromJson(Map<String, dynamic> json) {
  return _Song.fromJson(json);
}

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
      _$SongCopyWithImpl<$Res, Song>;
  @useResult
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
class _$SongCopyWithImpl<$Res, $Val extends Song>
    implements $SongCopyWith<$Res> {
  _$SongCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? artist = null,
    Object? url = null,
    Object? bpm = null,
    Object? unitDuration = null,
    Object? tilesCount = null,
    Object? duration = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      bpm: null == bpm
          ? _value.bpm
          : bpm // ignore: cast_nullable_to_non_nullable
              as int,
      unitDuration: null == unitDuration
          ? _value.unitDuration
          : unitDuration // ignore: cast_nullable_to_non_nullable
              as int,
      tilesCount: null == tilesCount
          ? _value.tilesCount
          : tilesCount // ignore: cast_nullable_to_non_nullable
              as List<int>,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as List<int>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SongCopyWith<$Res> implements $SongCopyWith<$Res> {
  factory _$$_SongCopyWith(_$_Song value, $Res Function(_$_Song) then) =
      __$$_SongCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_SongCopyWithImpl<$Res> extends _$SongCopyWithImpl<$Res, _$_Song>
    implements _$$_SongCopyWith<$Res> {
  __$$_SongCopyWithImpl(_$_Song _value, $Res Function(_$_Song) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? artist = null,
    Object? url = null,
    Object? bpm = null,
    Object? unitDuration = null,
    Object? tilesCount = null,
    Object? duration = null,
    Object? tags = null,
  }) {
    return _then(_$_Song(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      bpm: null == bpm
          ? _value.bpm
          : bpm // ignore: cast_nullable_to_non_nullable
              as int,
      unitDuration: null == unitDuration
          ? _value.unitDuration
          : unitDuration // ignore: cast_nullable_to_non_nullable
              as int,
      tilesCount: null == tilesCount
          ? _value._tilesCount
          : tilesCount // ignore: cast_nullable_to_non_nullable
              as List<int>,
      duration: null == duration
          ? _value._duration
          : duration // ignore: cast_nullable_to_non_nullable
              as List<int>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Song implements _Song {
  _$_Song(
      {required this.id,
      required this.title,
      required this.artist,
      required this.url,
      required this.bpm,
      required this.unitDuration,
      required final List<int> tilesCount,
      required final List<int> duration,
      required final List<String> tags})
      : _tilesCount = tilesCount,
        _duration = duration,
        _tags = tags;

  factory _$_Song.fromJson(Map<String, dynamic> json) => _$$_SongFromJson(json);

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
  final List<int> _tilesCount;
  @override
  List<int> get tilesCount {
    if (_tilesCount is EqualUnmodifiableListView) return _tilesCount;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tilesCount);
  }

  final List<int> _duration;
  @override
  List<int> get duration {
    if (_duration is EqualUnmodifiableListView) return _duration;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_duration);
  }

  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'Song(id: $id, title: $title, artist: $artist, url: $url, bpm: $bpm, unitDuration: $unitDuration, tilesCount: $tilesCount, duration: $duration, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Song &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.bpm, bpm) || other.bpm == bpm) &&
            (identical(other.unitDuration, unitDuration) ||
                other.unitDuration == unitDuration) &&
            const DeepCollectionEquality()
                .equals(other._tilesCount, _tilesCount) &&
            const DeepCollectionEquality().equals(other._duration, _duration) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      artist,
      url,
      bpm,
      unitDuration,
      const DeepCollectionEquality().hash(_tilesCount),
      const DeepCollectionEquality().hash(_duration),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SongCopyWith<_$_Song> get copyWith =>
      __$$_SongCopyWithImpl<_$_Song>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SongToJson(
      this,
    );
  }
}

abstract class _Song implements Song {
  factory _Song(
      {required final String id,
      required final String title,
      required final String artist,
      required final String url,
      required final int bpm,
      required final int unitDuration,
      required final List<int> tilesCount,
      required final List<int> duration,
      required final List<String> tags}) = _$_Song;

  factory _Song.fromJson(Map<String, dynamic> json) = _$_Song.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get artist;
  @override
  String get url;
  @override
  int get bpm;
  @override
  int get unitDuration;
  @override
  List<int> get tilesCount;
  @override
  List<int> get duration;
  @override
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$_SongCopyWith<_$_Song> get copyWith => throw _privateConstructorUsedError;
}
