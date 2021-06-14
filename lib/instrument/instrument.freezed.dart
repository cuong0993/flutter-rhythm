// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'instrument.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Instrument _$InstrumentFromJson(Map<String, dynamic> json) {
  return _Instrument.fromJson(json);
}

/// @nodoc
class _$InstrumentTearOff {
  const _$InstrumentTearOff();

  _Instrument call(
      {required String id,
      required Map<int, String> soundPaths,
      required Map<int, int> baseNotes,
      required int minNote,
      required int maxNote}) {
    return _Instrument(
      id: id,
      soundPaths: soundPaths,
      baseNotes: baseNotes,
      minNote: minNote,
      maxNote: maxNote,
    );
  }

  Instrument fromJson(Map<String, Object> json) {
    return Instrument.fromJson(json);
  }
}

/// @nodoc
const $Instrument = _$InstrumentTearOff();

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
      _$InstrumentCopyWithImpl<$Res>;
  $Res call(
      {String id,
      Map<int, String> soundPaths,
      Map<int, int> baseNotes,
      int minNote,
      int maxNote});
}

/// @nodoc
class _$InstrumentCopyWithImpl<$Res> implements $InstrumentCopyWith<$Res> {
  _$InstrumentCopyWithImpl(this._value, this._then);

  final Instrument _value;
  // ignore: unused_field
  final $Res Function(Instrument) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? soundPaths = freezed,
    Object? baseNotes = freezed,
    Object? minNote = freezed,
    Object? maxNote = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      soundPaths: soundPaths == freezed
          ? _value.soundPaths
          : soundPaths // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      baseNotes: baseNotes == freezed
          ? _value.baseNotes
          : baseNotes // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      minNote: minNote == freezed
          ? _value.minNote
          : minNote // ignore: cast_nullable_to_non_nullable
              as int,
      maxNote: maxNote == freezed
          ? _value.maxNote
          : maxNote // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$InstrumentCopyWith<$Res> implements $InstrumentCopyWith<$Res> {
  factory _$InstrumentCopyWith(
          _Instrument value, $Res Function(_Instrument) then) =
      __$InstrumentCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      Map<int, String> soundPaths,
      Map<int, int> baseNotes,
      int minNote,
      int maxNote});
}

/// @nodoc
class __$InstrumentCopyWithImpl<$Res> extends _$InstrumentCopyWithImpl<$Res>
    implements _$InstrumentCopyWith<$Res> {
  __$InstrumentCopyWithImpl(
      _Instrument _value, $Res Function(_Instrument) _then)
      : super(_value, (v) => _then(v as _Instrument));

  @override
  _Instrument get _value => super._value as _Instrument;

  @override
  $Res call({
    Object? id = freezed,
    Object? soundPaths = freezed,
    Object? baseNotes = freezed,
    Object? minNote = freezed,
    Object? maxNote = freezed,
  }) {
    return _then(_Instrument(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      soundPaths: soundPaths == freezed
          ? _value.soundPaths
          : soundPaths // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      baseNotes: baseNotes == freezed
          ? _value.baseNotes
          : baseNotes // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      minNote: minNote == freezed
          ? _value.minNote
          : minNote // ignore: cast_nullable_to_non_nullable
              as int,
      maxNote: maxNote == freezed
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
      required this.soundPaths,
      required this.baseNotes,
      required this.minNote,
      required this.maxNote});

  factory _$_Instrument.fromJson(Map<String, dynamic> json) =>
      _$_$_InstrumentFromJson(json);

  @override
  final String id;
  @override
  final Map<int, String> soundPaths;
  @override
  final Map<int, int> baseNotes;
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
        (other is _Instrument &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.soundPaths, soundPaths) ||
                const DeepCollectionEquality()
                    .equals(other.soundPaths, soundPaths)) &&
            (identical(other.baseNotes, baseNotes) ||
                const DeepCollectionEquality()
                    .equals(other.baseNotes, baseNotes)) &&
            (identical(other.minNote, minNote) ||
                const DeepCollectionEquality()
                    .equals(other.minNote, minNote)) &&
            (identical(other.maxNote, maxNote) ||
                const DeepCollectionEquality().equals(other.maxNote, maxNote)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(soundPaths) ^
      const DeepCollectionEquality().hash(baseNotes) ^
      const DeepCollectionEquality().hash(minNote) ^
      const DeepCollectionEquality().hash(maxNote);

  @JsonKey(ignore: true)
  @override
  _$InstrumentCopyWith<_Instrument> get copyWith =>
      __$InstrumentCopyWithImpl<_Instrument>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_InstrumentToJson(this);
  }
}

abstract class _Instrument implements Instrument {
  factory _Instrument(
      {required String id,
      required Map<int, String> soundPaths,
      required Map<int, int> baseNotes,
      required int minNote,
      required int maxNote}) = _$_Instrument;

  factory _Instrument.fromJson(Map<String, dynamic> json) =
      _$_Instrument.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  Map<int, String> get soundPaths => throw _privateConstructorUsedError;
  @override
  Map<int, int> get baseNotes => throw _privateConstructorUsedError;
  @override
  int get minNote => throw _privateConstructorUsedError;
  @override
  int get maxNote => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InstrumentCopyWith<_Instrument> get copyWith =>
      throw _privateConstructorUsedError;
}
