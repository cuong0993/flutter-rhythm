// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instrument.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Instrument> _$instrumentSerializer = new _$InstrumentSerializer();

class _$InstrumentSerializer implements StructuredSerializer<Instrument> {
  @override
  final Iterable<Type> types = const [Instrument, _$Instrument];
  @override
  final String wireName = 'Instrument';

  @override
  Iterable<Object> serialize(Serializers serializers, Instrument object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'soundFiles',
      serializers.serialize(object.soundFiles,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(int), const FullType(String)])),
      'soundNotes',
      serializers.serialize(object.soundNotes,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(int), const FullType(PitchNote)])),
      'minNote',
      serializers.serialize(object.minNote, specifiedType: const FullType(int)),
      'maxNote',
      serializers.serialize(object.maxNote, specifiedType: const FullType(int)),
      'volume',
      serializers.serialize(object.volume,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  Instrument deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InstrumentBuilder();

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
        case 'soundFiles':
          result.soundFiles.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(int), const FullType(String)])));
          break;
        case 'soundNotes':
          result.soundNotes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(int), const FullType(PitchNote)])));
          break;
        case 'minNote':
          result.minNote = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'maxNote':
          result.maxNote = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'volume':
          result.volume = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$Instrument extends Instrument {
  @override
  final String id;
  @override
  final BuiltMap<int, String> soundFiles;
  @override
  final BuiltMap<int, PitchNote> soundNotes;
  @override
  final int minNote;
  @override
  final int maxNote;
  @override
  final double volume;

  factory _$Instrument([void Function(InstrumentBuilder) updates]) =>
      (new InstrumentBuilder()..update(updates)).build();

  _$Instrument._(
      {this.id,
      this.soundFiles,
      this.soundNotes,
      this.minNote,
      this.maxNote,
      this.volume})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Instrument', 'id');
    }
    if (soundFiles == null) {
      throw new BuiltValueNullFieldError('Instrument', 'soundFiles');
    }
    if (soundNotes == null) {
      throw new BuiltValueNullFieldError('Instrument', 'soundNotes');
    }
    if (minNote == null) {
      throw new BuiltValueNullFieldError('Instrument', 'minNote');
    }
    if (maxNote == null) {
      throw new BuiltValueNullFieldError('Instrument', 'maxNote');
    }
    if (volume == null) {
      throw new BuiltValueNullFieldError('Instrument', 'volume');
    }
  }

  @override
  Instrument rebuild(void Function(InstrumentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InstrumentBuilder toBuilder() => new InstrumentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Instrument &&
        id == other.id &&
        soundFiles == other.soundFiles &&
        soundNotes == other.soundNotes &&
        minNote == other.minNote &&
        maxNote == other.maxNote &&
        volume == other.volume;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), soundFiles.hashCode),
                    soundNotes.hashCode),
                minNote.hashCode),
            maxNote.hashCode),
        volume.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Instrument')
          ..add('id', id)
          ..add('soundFiles', soundFiles)
          ..add('soundNotes', soundNotes)
          ..add('minNote', minNote)
          ..add('maxNote', maxNote)
          ..add('volume', volume))
        .toString();
  }
}

class InstrumentBuilder implements Builder<Instrument, InstrumentBuilder> {
  _$Instrument _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  MapBuilder<int, String> _soundFiles;
  MapBuilder<int, String> get soundFiles =>
      _$this._soundFiles ??= new MapBuilder<int, String>();
  set soundFiles(MapBuilder<int, String> soundFiles) =>
      _$this._soundFiles = soundFiles;

  MapBuilder<int, PitchNote> _soundNotes;
  MapBuilder<int, PitchNote> get soundNotes =>
      _$this._soundNotes ??= new MapBuilder<int, PitchNote>();
  set soundNotes(MapBuilder<int, PitchNote> soundNotes) =>
      _$this._soundNotes = soundNotes;

  int _minNote;
  int get minNote => _$this._minNote;
  set minNote(int minNote) => _$this._minNote = minNote;

  int _maxNote;
  int get maxNote => _$this._maxNote;
  set maxNote(int maxNote) => _$this._maxNote = maxNote;

  double _volume;
  double get volume => _$this._volume;
  set volume(double volume) => _$this._volume = volume;

  InstrumentBuilder();

  InstrumentBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _soundFiles = _$v.soundFiles?.toBuilder();
      _soundNotes = _$v.soundNotes?.toBuilder();
      _minNote = _$v.minNote;
      _maxNote = _$v.maxNote;
      _volume = _$v.volume;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Instrument other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Instrument;
  }

  @override
  void update(void Function(InstrumentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Instrument build() {
    _$Instrument _$result;
    try {
      _$result = _$v ??
          new _$Instrument._(
              id: id,
              soundFiles: soundFiles.build(),
              soundNotes: soundNotes.build(),
              minNote: minNote,
              maxNote: maxNote,
              volume: volume);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'soundFiles';
        soundFiles.build();
        _$failedField = 'soundNotes';
        soundNotes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Instrument', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
