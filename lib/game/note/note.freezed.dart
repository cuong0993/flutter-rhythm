// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NoteTearOff {
  const _$NoteTearOff();

  _Note call({required int note, required int startTick}) {
    return _Note(
      note: note,
      startTick: startTick,
    );
  }
}

/// @nodoc
const $Note = _$NoteTearOff();

/// @nodoc
mixin _$Note {
  int get note => throw _privateConstructorUsedError;
  int get startTick => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteCopyWith<Note> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteCopyWith<$Res> {
  factory $NoteCopyWith(Note value, $Res Function(Note) then) =
      _$NoteCopyWithImpl<$Res>;
  $Res call({int note, int startTick});
}

/// @nodoc
class _$NoteCopyWithImpl<$Res> implements $NoteCopyWith<$Res> {
  _$NoteCopyWithImpl(this._value, this._then);

  final Note _value;
  // ignore: unused_field
  final $Res Function(Note) _then;

  @override
  $Res call({
    Object? note = freezed,
    Object? startTick = freezed,
  }) {
    return _then(_value.copyWith(
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as int,
      startTick: startTick == freezed
          ? _value.startTick
          : startTick // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$NoteCopyWith<$Res> implements $NoteCopyWith<$Res> {
  factory _$NoteCopyWith(_Note value, $Res Function(_Note) then) =
      __$NoteCopyWithImpl<$Res>;
  @override
  $Res call({int note, int startTick});
}

/// @nodoc
class __$NoteCopyWithImpl<$Res> extends _$NoteCopyWithImpl<$Res>
    implements _$NoteCopyWith<$Res> {
  __$NoteCopyWithImpl(_Note _value, $Res Function(_Note) _then)
      : super(_value, (v) => _then(v as _Note));

  @override
  _Note get _value => super._value as _Note;

  @override
  $Res call({
    Object? note = freezed,
    Object? startTick = freezed,
  }) {
    return _then(_Note(
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as int,
      startTick: startTick == freezed
          ? _value.startTick
          : startTick // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Note implements _Note {
  _$_Note({required this.note, required this.startTick});

  @override
  final int note;
  @override
  final int startTick;

  @override
  String toString() {
    return 'Note(note: $note, startTick: $startTick)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Note &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.startTick, startTick) ||
                const DeepCollectionEquality()
                    .equals(other.startTick, startTick)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(startTick);

  @JsonKey(ignore: true)
  @override
  _$NoteCopyWith<_Note> get copyWith =>
      __$NoteCopyWithImpl<_Note>(this, _$identity);
}

abstract class _Note implements Note {
  factory _Note({required int note, required int startTick}) = _$_Note;

  @override
  int get note => throw _privateConstructorUsedError;
  @override
  int get startTick => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NoteCopyWith<_Note> get copyWith => throw _privateConstructorUsedError;
}
