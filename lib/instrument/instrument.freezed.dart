// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instrument.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Instrument _$InstrumentFromJson(Map<String, dynamic> json) {
  return _Instrument.fromJson(json);
}

/// @nodoc
mixin _$Instrument {
  String get id => throw _privateConstructorUsedError;
  Map<int, String> get soundPaths => throw _privateConstructorUsedError;
  Map<int, int> get baseNotes => throw _privateConstructorUsedError;
  int get minNote => throw _privateConstructorUsedError;
  int get maxNote => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InstrumentCopyWith<Instrument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstrumentCopyWith<$Res> {
  factory $InstrumentCopyWith(
          Instrument value, $Res Function(Instrument) then) =
      _$InstrumentCopyWithImpl<$Res, Instrument>;
  @useResult
  $Res call(
      {String id,
      Map<int, String> soundPaths,
      Map<int, int> baseNotes,
      int minNote,
      int maxNote});
}

/// @nodoc
class _$InstrumentCopyWithImpl<$Res, $Val extends Instrument>
    implements $InstrumentCopyWith<$Res> {
  _$InstrumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? soundPaths = null,
    Object? baseNotes = null,
    Object? minNote = null,
    Object? maxNote = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      soundPaths: null == soundPaths
          ? _value.soundPaths
          : soundPaths // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      baseNotes: null == baseNotes
          ? _value.baseNotes
          : baseNotes // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      minNote: null == minNote
          ? _value.minNote
          : minNote // ignore: cast_nullable_to_non_nullable
              as int,
      maxNote: null == maxNote
          ? _value.maxNote
          : maxNote // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InstrumentCopyWith<$Res>
    implements $InstrumentCopyWith<$Res> {
  factory _$$_InstrumentCopyWith(
          _$_Instrument value, $Res Function(_$_Instrument) then) =
      __$$_InstrumentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Map<int, String> soundPaths,
      Map<int, int> baseNotes,
      int minNote,
      int maxNote});
}

/// @nodoc
class __$$_InstrumentCopyWithImpl<$Res>
    extends _$InstrumentCopyWithImpl<$Res, _$_Instrument>
    implements _$$_InstrumentCopyWith<$Res> {
  __$$_InstrumentCopyWithImpl(
      _$_Instrument _value, $Res Function(_$_Instrument) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? soundPaths = null,
    Object? baseNotes = null,
    Object? minNote = null,
    Object? maxNote = null,
  }) {
    return _then(_$_Instrument(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      soundPaths: null == soundPaths
          ? _value._soundPaths
          : soundPaths // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      baseNotes: null == baseNotes
          ? _value._baseNotes
          : baseNotes // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      minNote: null == minNote
          ? _value.minNote
          : minNote // ignore: cast_nullable_to_non_nullable
              as int,
      maxNote: null == maxNote
          ? _value.maxNote
          : maxNote // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Instrument implements _Instrument {
  _$_Instrument(
      {required this.id,
      required final Map<int, String> soundPaths,
      required final Map<int, int> baseNotes,
      required this.minNote,
      required this.maxNote})
      : _soundPaths = soundPaths,
        _baseNotes = baseNotes;

  factory _$_Instrument.fromJson(Map<String, dynamic> json) =>
      _$$_InstrumentFromJson(json);

  @override
  final String id;
  final Map<int, String> _soundPaths;
  @override
  Map<int, String> get soundPaths {
    if (_soundPaths is EqualUnmodifiableMapView) return _soundPaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_soundPaths);
  }

  final Map<int, int> _baseNotes;
  @override
  Map<int, int> get baseNotes {
    if (_baseNotes is EqualUnmodifiableMapView) return _baseNotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_baseNotes);
  }

  @override
  final int minNote;
  @override
  final int maxNote;

  @override
  String toString() {
    return 'Instrument(id: $id, soundPaths: $soundPaths, baseNotes: $baseNotes, minNote: $minNote, maxNote: $maxNote)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Instrument &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._soundPaths, _soundPaths) &&
            const DeepCollectionEquality()
                .equals(other._baseNotes, _baseNotes) &&
            (identical(other.minNote, minNote) || other.minNote == minNote) &&
            (identical(other.maxNote, maxNote) || other.maxNote == maxNote));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_soundPaths),
      const DeepCollectionEquality().hash(_baseNotes),
      minNote,
      maxNote);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InstrumentCopyWith<_$_Instrument> get copyWith =>
      __$$_InstrumentCopyWithImpl<_$_Instrument>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InstrumentToJson(
      this,
    );
  }
}

abstract class _Instrument implements Instrument {
  factory _Instrument(
      {required final String id,
      required final Map<int, String> soundPaths,
      required final Map<int, int> baseNotes,
      required final int minNote,
      required final int maxNote}) = _$_Instrument;

  factory _Instrument.fromJson(Map<String, dynamic> json) =
      _$_Instrument.fromJson;

  @override
  String get id;
  @override
  Map<int, String> get soundPaths;
  @override
  Map<int, int> get baseNotes;
  @override
  int get minNote;
  @override
  int get maxNote;
  @override
  @JsonKey(ignore: true)
  _$$_InstrumentCopyWith<_$_Instrument> get copyWith =>
      throw _privateConstructorUsedError;
}
