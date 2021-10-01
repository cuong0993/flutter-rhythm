// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tile_chunk.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TileChunkTearOff {
  const _$TileChunkTearOff();

  _TileChunk call(
      {required List<Note> notes,
      required int durationToPrevious,
      required int startTick}) {
    return _TileChunk(
      notes: notes,
      durationToPrevious: durationToPrevious,
      startTick: startTick,
    );
  }
}

/// @nodoc
const $TileChunk = _$TileChunkTearOff();

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
      _$TileChunkCopyWithImpl<$Res>;
  $Res call({List<Note> notes, int durationToPrevious, int startTick});
}

/// @nodoc
class _$TileChunkCopyWithImpl<$Res> implements $TileChunkCopyWith<$Res> {
  _$TileChunkCopyWithImpl(this._value, this._then);

  final TileChunk _value;
  // ignore: unused_field
  final $Res Function(TileChunk) _then;

  @override
  $Res call({
    Object? notes = freezed,
    Object? durationToPrevious = freezed,
    Object? startTick = freezed,
  }) {
    return _then(_value.copyWith(
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      durationToPrevious: durationToPrevious == freezed
          ? _value.durationToPrevious
          : durationToPrevious // ignore: cast_nullable_to_non_nullable
              as int,
      startTick: startTick == freezed
          ? _value.startTick
          : startTick // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$TileChunkCopyWith<$Res> implements $TileChunkCopyWith<$Res> {
  factory _$TileChunkCopyWith(
          _TileChunk value, $Res Function(_TileChunk) then) =
      __$TileChunkCopyWithImpl<$Res>;
  @override
  $Res call({List<Note> notes, int durationToPrevious, int startTick});
}

/// @nodoc
class __$TileChunkCopyWithImpl<$Res> extends _$TileChunkCopyWithImpl<$Res>
    implements _$TileChunkCopyWith<$Res> {
  __$TileChunkCopyWithImpl(_TileChunk _value, $Res Function(_TileChunk) _then)
      : super(_value, (v) => _then(v as _TileChunk));

  @override
  _TileChunk get _value => super._value as _TileChunk;

  @override
  $Res call({
    Object? notes = freezed,
    Object? durationToPrevious = freezed,
    Object? startTick = freezed,
  }) {
    return _then(_TileChunk(
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      durationToPrevious: durationToPrevious == freezed
          ? _value.durationToPrevious
          : durationToPrevious // ignore: cast_nullable_to_non_nullable
              as int,
      startTick: startTick == freezed
          ? _value.startTick
          : startTick // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TileChunk implements _TileChunk {
  _$_TileChunk(
      {required this.notes,
      required this.durationToPrevious,
      required this.startTick});

  @override
  final List<Note> notes;
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
            other is _TileChunk &&
            const DeepCollectionEquality().equals(other.notes, notes) &&
            (identical(other.durationToPrevious, durationToPrevious) ||
                other.durationToPrevious == durationToPrevious) &&
            (identical(other.startTick, startTick) ||
                other.startTick == startTick));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(notes),
      durationToPrevious,
      startTick);

  @JsonKey(ignore: true)
  @override
  _$TileChunkCopyWith<_TileChunk> get copyWith =>
      __$TileChunkCopyWithImpl<_TileChunk>(this, _$identity);
}

abstract class _TileChunk implements TileChunk {
  factory _TileChunk(
      {required List<Note> notes,
      required int durationToPrevious,
      required int startTick}) = _$_TileChunk;

  @override
  List<Note> get notes;
  @override
  int get durationToPrevious;
  @override
  int get startTick;
  @override
  @JsonKey(ignore: true)
  _$TileChunkCopyWith<_TileChunk> get copyWith =>
      throw _privateConstructorUsedError;
}
