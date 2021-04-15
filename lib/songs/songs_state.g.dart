// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songs_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SongsInitial extends SongsInitial {
  factory _$SongsInitial([void Function(SongsInitialBuilder)? updates]) =>
      (new SongsInitialBuilder()..update(updates)).build();

  _$SongsInitial._() : super._();

  @override
  SongsInitial rebuild(void Function(SongsInitialBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SongsInitialBuilder toBuilder() => new SongsInitialBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SongsInitial;
  }

  @override
  int get hashCode {
    return 918519730;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('SongsInitial').toString();
  }
}

class SongsInitialBuilder
    implements Builder<SongsInitial, SongsInitialBuilder> {
  _$SongsInitial? _$v;

  SongsInitialBuilder();

  @override
  void replace(SongsInitial other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SongsInitial;
  }

  @override
  void update(void Function(SongsInitialBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SongsInitial build() {
    final _$result = _$v ?? new _$SongsInitial._();
    replace(_$result);
    return _$result;
  }
}

class _$SongsLoaded extends SongsLoaded {
  @override
  final List<List<Song>> songsByTags;
  @override
  final List<bool> isLoadingMoreByTags;
  @override
  final List<bool> isLoadedByTags;

  factory _$SongsLoaded([void Function(SongsLoadedBuilder)? updates]) =>
      (new SongsLoadedBuilder()..update(updates)).build();

  _$SongsLoaded._(
      {required this.songsByTags,
      required this.isLoadingMoreByTags,
      required this.isLoadedByTags})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        songsByTags, 'SongsLoaded', 'songsByTags');
    BuiltValueNullFieldError.checkNotNull(
        isLoadingMoreByTags, 'SongsLoaded', 'isLoadingMoreByTags');
    BuiltValueNullFieldError.checkNotNull(
        isLoadedByTags, 'SongsLoaded', 'isLoadedByTags');
  }

  @override
  SongsLoaded rebuild(void Function(SongsLoadedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SongsLoadedBuilder toBuilder() => new SongsLoadedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SongsLoaded &&
        songsByTags == other.songsByTags &&
        isLoadingMoreByTags == other.isLoadingMoreByTags &&
        isLoadedByTags == other.isLoadedByTags;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, songsByTags.hashCode), isLoadingMoreByTags.hashCode),
        isLoadedByTags.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SongsLoaded')
          ..add('songsByTags', songsByTags)
          ..add('isLoadingMoreByTags', isLoadingMoreByTags)
          ..add('isLoadedByTags', isLoadedByTags))
        .toString();
  }
}

class SongsLoadedBuilder implements Builder<SongsLoaded, SongsLoadedBuilder> {
  _$SongsLoaded? _$v;

  List<List<Song>>? _songsByTags;
  List<List<Song>>? get songsByTags => _$this._songsByTags;
  set songsByTags(List<List<Song>>? songsByTags) =>
      _$this._songsByTags = songsByTags;

  List<bool>? _isLoadingMoreByTags;
  List<bool>? get isLoadingMoreByTags => _$this._isLoadingMoreByTags;
  set isLoadingMoreByTags(List<bool>? isLoadingMoreByTags) =>
      _$this._isLoadingMoreByTags = isLoadingMoreByTags;

  List<bool>? _isLoadedByTags;
  List<bool>? get isLoadedByTags => _$this._isLoadedByTags;
  set isLoadedByTags(List<bool>? isLoadedByTags) =>
      _$this._isLoadedByTags = isLoadedByTags;

  SongsLoadedBuilder();

  SongsLoadedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _songsByTags = $v.songsByTags;
      _isLoadingMoreByTags = $v.isLoadingMoreByTags;
      _isLoadedByTags = $v.isLoadedByTags;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SongsLoaded other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SongsLoaded;
  }

  @override
  void update(void Function(SongsLoadedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SongsLoaded build() {
    final _$result = _$v ??
        new _$SongsLoaded._(
            songsByTags: BuiltValueNullFieldError.checkNotNull(
                songsByTags, 'SongsLoaded', 'songsByTags'),
            isLoadingMoreByTags: BuiltValueNullFieldError.checkNotNull(
                isLoadingMoreByTags, 'SongsLoaded', 'isLoadingMoreByTags'),
            isLoadedByTags: BuiltValueNullFieldError.checkNotNull(
                isLoadedByTags, 'SongsLoaded', 'isLoadedByTags'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
