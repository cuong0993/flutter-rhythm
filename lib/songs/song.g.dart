// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Song> _$songSerializer = new _$SongSerializer();

class _$SongSerializer implements StructuredSerializer<Song> {
  @override
  final Iterable<Type> types = const [Song, _$Song];
  @override
  final String wireName = 'Song';

  @override
  Iterable<Object> serialize(Serializers serializers, Song object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'artist',
      serializers.serialize(object.artist,
          specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'bpm',
      serializers.serialize(object.bpm, specifiedType: const FullType(int)),
      'tilesCount',
      serializers.serialize(object.tilesCount,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'duration',
      serializers.serialize(object.duration,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'tags',
      serializers.serialize(object.tags,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  Song deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SongBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'artist':
          result.artist = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bpm':
          result.bpm = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'tilesCount':
          result.tilesCount.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<Object>);
          break;
        case 'duration':
          result.duration.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<Object>);
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$Song extends Song {
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
  final BuiltList<int> tilesCount;
  @override
  final BuiltList<int> duration;
  @override
  final BuiltList<String> tags;

  factory _$Song([void Function(SongBuilder) updates]) =>
      (new SongBuilder()..update(updates)).build();

  _$Song._(
      {this.id,
      this.title,
      this.artist,
      this.url,
      this.bpm,
      this.tilesCount,
      this.duration,
      this.tags})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Song', 'id');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('Song', 'title');
    }
    if (artist == null) {
      throw new BuiltValueNullFieldError('Song', 'artist');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('Song', 'url');
    }
    if (bpm == null) {
      throw new BuiltValueNullFieldError('Song', 'bpm');
    }
    if (tilesCount == null) {
      throw new BuiltValueNullFieldError('Song', 'tilesCount');
    }
    if (duration == null) {
      throw new BuiltValueNullFieldError('Song', 'duration');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError('Song', 'tags');
    }
  }

  @override
  Song rebuild(void Function(SongBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SongBuilder toBuilder() => new SongBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Song &&
        id == other.id &&
        title == other.title &&
        artist == other.artist &&
        url == other.url &&
        bpm == other.bpm &&
        tilesCount == other.tilesCount &&
        duration == other.duration &&
        tags == other.tags;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, id.hashCode), title.hashCode),
                            artist.hashCode),
                        url.hashCode),
                    bpm.hashCode),
                tilesCount.hashCode),
            duration.hashCode),
        tags.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Song')
          ..add('id', id)
          ..add('title', title)
          ..add('artist', artist)
          ..add('url', url)
          ..add('bpm', bpm)
          ..add('tilesCount', tilesCount)
          ..add('duration', duration)
          ..add('tags', tags))
        .toString();
  }
}

class SongBuilder implements Builder<Song, SongBuilder> {
  _$Song _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _artist;
  String get artist => _$this._artist;
  set artist(String artist) => _$this._artist = artist;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  int _bpm;
  int get bpm => _$this._bpm;
  set bpm(int bpm) => _$this._bpm = bpm;

  ListBuilder<int> _tilesCount;
  ListBuilder<int> get tilesCount =>
      _$this._tilesCount ??= new ListBuilder<int>();
  set tilesCount(ListBuilder<int> tilesCount) =>
      _$this._tilesCount = tilesCount;

  ListBuilder<int> _duration;
  ListBuilder<int> get duration => _$this._duration ??= new ListBuilder<int>();
  set duration(ListBuilder<int> duration) => _$this._duration = duration;

  ListBuilder<String> _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String> tags) => _$this._tags = tags;

  SongBuilder();

  SongBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _title = _$v.title;
      _artist = _$v.artist;
      _url = _$v.url;
      _bpm = _$v.bpm;
      _tilesCount = _$v.tilesCount?.toBuilder();
      _duration = _$v.duration?.toBuilder();
      _tags = _$v.tags?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Song other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Song;
  }

  @override
  void update(void Function(SongBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Song build() {
    _$Song _$result;
    try {
      _$result = _$v ??
          new _$Song._(
              id: id,
              title: title,
              artist: artist,
              url: url,
              bpm: bpm,
              tilesCount: tilesCount.build(),
              duration: duration.build(),
              tags: tags.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tilesCount';
        tilesCount.build();
        _$failedField = 'duration';
        duration.build();
        _$failedField = 'tags';
        tags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Song', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
