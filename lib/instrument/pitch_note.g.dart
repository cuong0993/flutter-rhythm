// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pitch_note.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PitchNote> _$pitchNoteSerializer = new _$PitchNoteSerializer();

class _$PitchNoteSerializer implements StructuredSerializer<PitchNote> {
  @override
  final Iterable<Type> types = const [PitchNote, _$PitchNote];
  @override
  final String wireName = 'PitchNote';

  @override
  Iterable<Object> serialize(Serializers serializers, PitchNote object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'note',
      serializers.serialize(object.note, specifiedType: const FullType(int)),
      'pitch',
      serializers.serialize(object.pitch,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  PitchNote deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PitchNoteBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'note':
          result.note = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'pitch':
          result.pitch = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$PitchNote extends PitchNote {
  @override
  final int note;
  @override
  final double pitch;

  factory _$PitchNote([void Function(PitchNoteBuilder) updates]) =>
      (new PitchNoteBuilder()..update(updates)).build();

  _$PitchNote._({this.note, this.pitch}) : super._() {
    if (note == null) {
      throw new BuiltValueNullFieldError('PitchNote', 'note');
    }
    if (pitch == null) {
      throw new BuiltValueNullFieldError('PitchNote', 'pitch');
    }
  }

  @override
  PitchNote rebuild(void Function(PitchNoteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PitchNoteBuilder toBuilder() => new PitchNoteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PitchNote && note == other.note && pitch == other.pitch;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, note.hashCode), pitch.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PitchNote')
          ..add('note', note)
          ..add('pitch', pitch))
        .toString();
  }
}

class PitchNoteBuilder implements Builder<PitchNote, PitchNoteBuilder> {
  _$PitchNote _$v;

  int _note;
  int get note => _$this._note;
  set note(int note) => _$this._note = note;

  double _pitch;
  double get pitch => _$this._pitch;
  set pitch(double pitch) => _$this._pitch = pitch;

  PitchNoteBuilder();

  PitchNoteBuilder get _$this {
    if (_$v != null) {
      _note = _$v.note;
      _pitch = _$v.pitch;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PitchNote other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PitchNote;
  }

  @override
  void update(void Function(PitchNoteBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PitchNote build() {
    final _$result = _$v ?? new _$PitchNote._(note: note, pitch: pitch);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
