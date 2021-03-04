// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tile_chunk.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TileChunk extends TileChunk {
  @override
  final BuiltList<Note> notes;
  @override
  final int durationToPrevious;
  @override
  final int startTick;

  factory _$TileChunk([void Function(TileChunkBuilder)? updates]) =>
      (new TileChunkBuilder()..update(updates)).build();

  _$TileChunk._(
      {required this.notes,
      required this.durationToPrevious,
      required this.startTick})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(notes, 'TileChunk', 'notes');
    BuiltValueNullFieldError.checkNotNull(
        durationToPrevious, 'TileChunk', 'durationToPrevious');
    BuiltValueNullFieldError.checkNotNull(startTick, 'TileChunk', 'startTick');
  }

  @override
  TileChunk rebuild(void Function(TileChunkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TileChunkBuilder toBuilder() => new TileChunkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TileChunk &&
        notes == other.notes &&
        durationToPrevious == other.durationToPrevious &&
        startTick == other.startTick;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, notes.hashCode), durationToPrevious.hashCode),
        startTick.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TileChunk')
          ..add('notes', notes)
          ..add('durationToPrevious', durationToPrevious)
          ..add('startTick', startTick))
        .toString();
  }
}

class TileChunkBuilder implements Builder<TileChunk, TileChunkBuilder> {
  _$TileChunk? _$v;

  ListBuilder<Note>? _notes;
  ListBuilder<Note> get notes => _$this._notes ??= new ListBuilder<Note>();
  set notes(ListBuilder<Note>? notes) => _$this._notes = notes;

  int? _durationToPrevious;
  int? get durationToPrevious => _$this._durationToPrevious;
  set durationToPrevious(int? durationToPrevious) =>
      _$this._durationToPrevious = durationToPrevious;

  int? _startTick;
  int? get startTick => _$this._startTick;
  set startTick(int? startTick) => _$this._startTick = startTick;

  TileChunkBuilder();

  TileChunkBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _notes = $v.notes.toBuilder();
      _durationToPrevious = $v.durationToPrevious;
      _startTick = $v.startTick;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TileChunk other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TileChunk;
  }

  @override
  void update(void Function(TileChunkBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TileChunk build() {
    _$TileChunk _$result;
    try {
      _$result = _$v ??
          new _$TileChunk._(
              notes: notes.build(),
              durationToPrevious: BuiltValueNullFieldError.checkNotNull(
                  durationToPrevious, 'TileChunk', 'durationToPrevious'),
              startTick: BuiltValueNullFieldError.checkNotNull(
                  startTick, 'TileChunk', 'startTick'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'notes';
        notes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TileChunk', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
