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
  Iterable<Object?> serialize(Serializers serializers, Instrument object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'soundPaths',
      serializers.serialize(object.soundPaths,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(int), const FullType(String)])),
      'baseNotes',
      serializers.serialize(object.baseNotes,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(int), const FullType(int)])),
      'minNote',
      serializers.serialize(object.minNote, specifiedType: const FullType(int)),
      'maxNote',
      serializers.serialize(object.maxNote, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Instrument deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InstrumentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'soundPaths':
          result.soundPaths.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(int), const FullType(String)]))!);
          break;
        case 'baseNotes':
          result.baseNotes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(int), const FullType(int)]))!);
          break;
        case 'minNote':
          result.minNote = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'maxNote':
          result.maxNote = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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
  final BuiltMap<int, String> soundPaths;
  @override
  final BuiltMap<int, int> baseNotes;
  @override
  final int minNote;
  @override
  final int maxNote;

  factory _$Instrument([void Function(InstrumentBuilder)? updates]) =>
      (new InstrumentBuilder()..update(updates)).build();

  _$Instrument._(
      {required this.id,
      required this.soundPaths,
      required this.baseNotes,
      required this.minNote,
      required this.maxNote})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Instrument', 'id');
    BuiltValueNullFieldError.checkNotNull(
        soundPaths, 'Instrument', 'soundPaths');
    BuiltValueNullFieldError.checkNotNull(baseNotes, 'Instrument', 'baseNotes');
    BuiltValueNullFieldError.checkNotNull(minNote, 'Instrument', 'minNote');
    BuiltValueNullFieldError.checkNotNull(maxNote, 'Instrument', 'maxNote');
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
        soundPaths == other.soundPaths &&
        baseNotes == other.baseNotes &&
        minNote == other.minNote &&
        maxNote == other.maxNote;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, id.hashCode), soundPaths.hashCode),
                baseNotes.hashCode),
            minNote.hashCode),
        maxNote.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Instrument')
          ..add('id', id)
          ..add('soundPaths', soundPaths)
          ..add('baseNotes', baseNotes)
          ..add('minNote', minNote)
          ..add('maxNote', maxNote))
        .toString();
  }
}

class InstrumentBuilder implements Builder<Instrument, InstrumentBuilder> {
  _$Instrument? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  MapBuilder<int, String>? _soundPaths;
  MapBuilder<int, String> get soundPaths =>
      _$this._soundPaths ??= new MapBuilder<int, String>();
  set soundPaths(MapBuilder<int, String>? soundPaths) =>
      _$this._soundPaths = soundPaths;

  MapBuilder<int, int>? _baseNotes;
  MapBuilder<int, int> get baseNotes =>
      _$this._baseNotes ??= new MapBuilder<int, int>();
  set baseNotes(MapBuilder<int, int>? baseNotes) =>
      _$this._baseNotes = baseNotes;

  int? _minNote;
  int? get minNote => _$this._minNote;
  set minNote(int? minNote) => _$this._minNote = minNote;

  int? _maxNote;
  int? get maxNote => _$this._maxNote;
  set maxNote(int? maxNote) => _$this._maxNote = maxNote;

  InstrumentBuilder();

  InstrumentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _soundPaths = $v.soundPaths.toBuilder();
      _baseNotes = $v.baseNotes.toBuilder();
      _minNote = $v.minNote;
      _maxNote = $v.maxNote;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Instrument other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Instrument;
  }

  @override
  void update(void Function(InstrumentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Instrument build() {
    _$Instrument _$result;
    try {
      _$result = _$v ??
          new _$Instrument._(
              id: BuiltValueNullFieldError.checkNotNull(id, 'Instrument', 'id'),
              soundPaths: soundPaths.build(),
              baseNotes: baseNotes.build(),
              minNote: BuiltValueNullFieldError.checkNotNull(
                  minNote, 'Instrument', 'minNote'),
              maxNote: BuiltValueNullFieldError.checkNotNull(
                  maxNote, 'Instrument', 'maxNote'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'soundPaths';
        soundPaths.build();
        _$failedField = 'baseNotes';
        baseNotes.build();
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
