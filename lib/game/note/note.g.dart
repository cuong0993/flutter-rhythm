// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Note extends Note {
  @override
  final int note;
  @override
  final int startTick;

  factory _$Note([void Function(NoteBuilder)? updates]) =>
      (new NoteBuilder()..update(updates)).build();

  _$Note._({required this.note, required this.startTick}) : super._() {
    BuiltValueNullFieldError.checkNotNull(note, 'Note', 'note');
    BuiltValueNullFieldError.checkNotNull(startTick, 'Note', 'startTick');
  }

  @override
  Note rebuild(void Function(NoteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NoteBuilder toBuilder() => new NoteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Note && note == other.note && startTick == other.startTick;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, note.hashCode), startTick.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Note')
          ..add('note', note)
          ..add('startTick', startTick))
        .toString();
  }
}

class NoteBuilder implements Builder<Note, NoteBuilder> {
  _$Note? _$v;

  int? _note;
  int? get note => _$this._note;
  set note(int? note) => _$this._note = note;

  int? _startTick;
  int? get startTick => _$this._startTick;
  set startTick(int? startTick) => _$this._startTick = startTick;

  NoteBuilder();

  NoteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _note = $v.note;
      _startTick = $v.startTick;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Note other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Note;
  }

  @override
  void update(void Function(NoteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Note build() {
    final _$result = _$v ??
        new _$Note._(
            note: BuiltValueNullFieldError.checkNotNull(note, 'Note', 'note'),
            startTick: BuiltValueNullFieldError.checkNotNull(
                startTick, 'Note', 'startTick'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
