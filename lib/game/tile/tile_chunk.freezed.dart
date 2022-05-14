// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tile_chunk.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TileChunk {
  List<Note> get notes => throw _privateConstructorUsedError;
  int get durationToPrevious => throw _privateConstructorUsedError;
  int get startTick => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TileChunkCopyWith<TileChunk> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TileChunkCopyWith<$Res> {
  factory $TileChunkCopyWith(TileChunk value, $Res Function(TileChunk) then) =
      _$TileChunkCopyWithImpl<$Res, TileChunk>;
  @useResult
  $Res call({List<Note> notes, int durationToPrevious, int startTick});
}

/// @nodoc
class _$TileChunkCopyWithImpl<$Res, $Val extends TileChunk>
    implements $TileChunkCopyWith<$Res> {
  _$TileChunkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
    Object? durationToPrevious = null,
    Object? startTick = null,
  }) {
    return _then(_value.copyWith(
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      durationToPrevious: null == durationToPrevious
          ? _value.durationToPrevious
          : durationToPrevious // ignore: cast_nullable_to_non_nullable
              as int,
      startTick: null == startTick
          ? _value.startTick
          : startTick // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TileChunkCopyWith<$Res> implements $TileChunkCopyWith<$Res> {
  factory _$$_TileChunkCopyWith(
          _$_TileChunk value, $Res Function(_$_TileChunk) then) =
      __$$_TileChunkCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Note> notes, int durationToPrevious, int startTick});
}

/// @nodoc
class __$$_TileChunkCopyWithImpl<$Res>
    extends _$TileChunkCopyWithImpl<$Res, _$_TileChunk>
    implements _$$_TileChunkCopyWith<$Res> {
  __$$_TileChunkCopyWithImpl(
      _$_TileChunk _value, $Res Function(_$_TileChunk) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
    Object? durationToPrevious = null,
    Object? startTick = null,
  }) {
    return _then(_$_TileChunk(
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      durationToPrevious: null == durationToPrevious
          ? _value.durationToPrevious
          : durationToPrevious // ignore: cast_nullable_to_non_nullable
              as int,
      startTick: null == startTick
          ? _value.startTick
          : startTick // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TileChunk implements _TileChunk {
  _$_TileChunk(
      {required final List<Note> notes,
      required this.durationToPrevious,
      required this.startTick})
      : _notes = notes;

  final List<Note> _notes;
  @override
  List<Note> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  final int durationToPrevious;
  @override
  final int startTick;

  @override
  String toString() {
    return 'TileChunk(notes: $notes, durationToPrevious: $durationToPrevious, startTick: $startTick)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TileChunk &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            (identical(other.durationToPrevious, durationToPrevious) ||
                other.durationToPrevious == durationToPrevious) &&
            (identical(other.startTick, startTick) ||
                other.startTick == startTick));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_notes),
      durationToPrevious,
      startTick);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TileChunkCopyWith<_$_TileChunk> get copyWith =>
      __$$_TileChunkCopyWithImpl<_$_TileChunk>(this, _$identity);
}

abstract class _TileChunk implements TileChunk {
  factory _TileChunk(
      {required final List<Note> notes,
      required final int durationToPrevious,
      required final int startTick}) = _$_TileChunk;

  @override
  List<Note> get notes;
  @override
  int get durationToPrevious;
  @override
  int get startTick;
  @override
  @JsonKey(ignore: true)
  _$$_TileChunkCopyWith<_$_TileChunk> get copyWith =>
      throw _privateConstructorUsedError;
}
