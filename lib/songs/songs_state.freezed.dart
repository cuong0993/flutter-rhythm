// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'songs_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SongsStateTearOff {
  const _$SongsStateTearOff();

  SongsStateLoading loading() {
    return SongsStateLoading();
  }

  SongsStateLoaded loaded(List<List<Song>> songsByTags,
      List<bool> isLoadingMoreByTags, List<bool> isLoadedByTags) {
    return SongsStateLoaded(
      songsByTags,
      isLoadingMoreByTags,
      isLoadedByTags,
    );
  }
}

/// @nodoc
const $SongsState = _$SongsStateTearOff();

/// @nodoc
mixin _$SongsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<List<Song>> songsByTags,
            List<bool> isLoadingMoreByTags, List<bool> isLoadedByTags)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<List<Song>> songsByTags,
            List<bool> isLoadingMoreByTags, List<bool> isLoadedByTags)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SongsStateLoading value) loading,
    required TResult Function(SongsStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SongsStateLoading value)? loading,
    TResult Function(SongsStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongsStateCopyWith<$Res> {
  factory $SongsStateCopyWith(
          SongsState value, $Res Function(SongsState) then) =
      _$SongsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SongsStateCopyWithImpl<$Res> implements $SongsStateCopyWith<$Res> {
  _$SongsStateCopyWithImpl(this._value, this._then);

  final SongsState _value;
  // ignore: unused_field
  final $Res Function(SongsState) _then;
}

/// @nodoc
abstract class $SongsStateLoadingCopyWith<$Res> {
  factory $SongsStateLoadingCopyWith(
          SongsStateLoading value, $Res Function(SongsStateLoading) then) =
      _$SongsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$SongsStateLoadingCopyWithImpl<$Res>
    extends _$SongsStateCopyWithImpl<$Res>
    implements $SongsStateLoadingCopyWith<$Res> {
  _$SongsStateLoadingCopyWithImpl(
      SongsStateLoading _value, $Res Function(SongsStateLoading) _then)
      : super(_value, (v) => _then(v as SongsStateLoading));

  @override
  SongsStateLoading get _value => super._value as SongsStateLoading;
}

/// @nodoc

class _$SongsStateLoading implements SongsStateLoading {
  _$SongsStateLoading();

  @override
  String toString() {
    return 'SongsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SongsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<List<Song>> songsByTags,
            List<bool> isLoadingMoreByTags, List<bool> isLoadedByTags)
        loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<List<Song>> songsByTags,
            List<bool> isLoadingMoreByTags, List<bool> isLoadedByTags)?
        loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SongsStateLoading value) loading,
    required TResult Function(SongsStateLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SongsStateLoading value)? loading,
    TResult Function(SongsStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SongsStateLoading implements SongsState {
  factory SongsStateLoading() = _$SongsStateLoading;
}

/// @nodoc
abstract class $SongsStateLoadedCopyWith<$Res> {
  factory $SongsStateLoadedCopyWith(
          SongsStateLoaded value, $Res Function(SongsStateLoaded) then) =
      _$SongsStateLoadedCopyWithImpl<$Res>;
  $Res call(
      {List<List<Song>> songsByTags,
      List<bool> isLoadingMoreByTags,
      List<bool> isLoadedByTags});
}

/// @nodoc
class _$SongsStateLoadedCopyWithImpl<$Res>
    extends _$SongsStateCopyWithImpl<$Res>
    implements $SongsStateLoadedCopyWith<$Res> {
  _$SongsStateLoadedCopyWithImpl(
      SongsStateLoaded _value, $Res Function(SongsStateLoaded) _then)
      : super(_value, (v) => _then(v as SongsStateLoaded));

  @override
  SongsStateLoaded get _value => super._value as SongsStateLoaded;

  @override
  $Res call({
    Object? songsByTags = freezed,
    Object? isLoadingMoreByTags = freezed,
    Object? isLoadedByTags = freezed,
  }) {
    return _then(SongsStateLoaded(
      songsByTags == freezed
          ? _value.songsByTags
          : songsByTags // ignore: cast_nullable_to_non_nullable
              as List<List<Song>>,
      isLoadingMoreByTags == freezed
          ? _value.isLoadingMoreByTags
          : isLoadingMoreByTags // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      isLoadedByTags == freezed
          ? _value.isLoadedByTags
          : isLoadedByTags // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ));
  }
}

/// @nodoc

class _$SongsStateLoaded implements SongsStateLoaded {
  _$SongsStateLoaded(
      this.songsByTags, this.isLoadingMoreByTags, this.isLoadedByTags);

  @override
  final List<List<Song>> songsByTags;
  @override
  final List<bool> isLoadingMoreByTags;
  @override
  final List<bool> isLoadedByTags;

  @override
  String toString() {
    return 'SongsState.loaded(songsByTags: $songsByTags, isLoadingMoreByTags: $isLoadingMoreByTags, isLoadedByTags: $isLoadedByTags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SongsStateLoaded &&
            (identical(other.songsByTags, songsByTags) ||
                const DeepCollectionEquality()
                    .equals(other.songsByTags, songsByTags)) &&
            (identical(other.isLoadingMoreByTags, isLoadingMoreByTags) ||
                const DeepCollectionEquality()
                    .equals(other.isLoadingMoreByTags, isLoadingMoreByTags)) &&
            (identical(other.isLoadedByTags, isLoadedByTags) ||
                const DeepCollectionEquality()
                    .equals(other.isLoadedByTags, isLoadedByTags)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(songsByTags) ^
      const DeepCollectionEquality().hash(isLoadingMoreByTags) ^
      const DeepCollectionEquality().hash(isLoadedByTags);

  @JsonKey(ignore: true)
  @override
  $SongsStateLoadedCopyWith<SongsStateLoaded> get copyWith =>
      _$SongsStateLoadedCopyWithImpl<SongsStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<List<Song>> songsByTags,
            List<bool> isLoadingMoreByTags, List<bool> isLoadedByTags)
        loaded,
  }) {
    return loaded(songsByTags, isLoadingMoreByTags, isLoadedByTags);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<List<Song>> songsByTags,
            List<bool> isLoadingMoreByTags, List<bool> isLoadedByTags)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(songsByTags, isLoadingMoreByTags, isLoadedByTags);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SongsStateLoading value) loading,
    required TResult Function(SongsStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SongsStateLoading value)? loading,
    TResult Function(SongsStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SongsStateLoaded implements SongsState {
  factory SongsStateLoaded(
      List<List<Song>> songsByTags,
      List<bool> isLoadingMoreByTags,
      List<bool> isLoadedByTags) = _$SongsStateLoaded;

  List<List<Song>> get songsByTags => throw _privateConstructorUsedError;
  List<bool> get isLoadingMoreByTags => throw _privateConstructorUsedError;
  List<bool> get isLoadedByTags => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongsStateLoadedCopyWith<SongsStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
