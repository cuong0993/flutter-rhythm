// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songs_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoadMoreSongsByTagNumbers extends LoadMoreSongsByTagNumbers {
  @override
  final List<int> tagNumbers;

  factory _$LoadMoreSongsByTagNumbers(
          [void Function(LoadMoreSongsByTagNumbersBuilder)? updates]) =>
      (new LoadMoreSongsByTagNumbersBuilder()..update(updates)).build();

  _$LoadMoreSongsByTagNumbers._({required this.tagNumbers}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        tagNumbers, 'LoadMoreSongsByTagNumbers', 'tagNumbers');
  }

  @override
  LoadMoreSongsByTagNumbers rebuild(
          void Function(LoadMoreSongsByTagNumbersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoadMoreSongsByTagNumbersBuilder toBuilder() =>
      new LoadMoreSongsByTagNumbersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoadMoreSongsByTagNumbers && tagNumbers == other.tagNumbers;
  }

  @override
  int get hashCode {
    return $jf($jc(0, tagNumbers.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoadMoreSongsByTagNumbers')
          ..add('tagNumbers', tagNumbers))
        .toString();
  }
}

class LoadMoreSongsByTagNumbersBuilder
    implements
        Builder<LoadMoreSongsByTagNumbers, LoadMoreSongsByTagNumbersBuilder> {
  _$LoadMoreSongsByTagNumbers? _$v;

  List<int>? _tagNumbers;
  List<int>? get tagNumbers => _$this._tagNumbers;
  set tagNumbers(List<int>? tagNumbers) => _$this._tagNumbers = tagNumbers;

  LoadMoreSongsByTagNumbersBuilder();

  LoadMoreSongsByTagNumbersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tagNumbers = $v.tagNumbers;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoadMoreSongsByTagNumbers other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoadMoreSongsByTagNumbers;
  }

  @override
  void update(void Function(LoadMoreSongsByTagNumbersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoadMoreSongsByTagNumbers build() {
    final _$result = _$v ??
        new _$LoadMoreSongsByTagNumbers._(
            tagNumbers: BuiltValueNullFieldError.checkNotNull(
                tagNumbers, 'LoadMoreSongsByTagNumbers', 'tagNumbers'));
    replace(_$result);
    return _$result;
  }
}

class _$UpdateSongs extends UpdateSongs {
  @override
  final List<List<Song>> songsByTags;
  @override
  final List<bool> isLoadingMoreByTags;
  @override
  final List<bool> isLoadedByTags;

  factory _$UpdateSongs([void Function(UpdateSongsBuilder)? updates]) =>
      (new UpdateSongsBuilder()..update(updates)).build();

  _$UpdateSongs._(
      {required this.songsByTags,
      required this.isLoadingMoreByTags,
      required this.isLoadedByTags})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        songsByTags, 'UpdateSongs', 'songsByTags');
    BuiltValueNullFieldError.checkNotNull(
        isLoadingMoreByTags, 'UpdateSongs', 'isLoadingMoreByTags');
    BuiltValueNullFieldError.checkNotNull(
        isLoadedByTags, 'UpdateSongs', 'isLoadedByTags');
  }

  @override
  UpdateSongs rebuild(void Function(UpdateSongsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateSongsBuilder toBuilder() => new UpdateSongsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateSongs &&
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
    return (newBuiltValueToStringHelper('UpdateSongs')
          ..add('songsByTags', songsByTags)
          ..add('isLoadingMoreByTags', isLoadingMoreByTags)
          ..add('isLoadedByTags', isLoadedByTags))
        .toString();
  }
}

class UpdateSongsBuilder implements Builder<UpdateSongs, UpdateSongsBuilder> {
  _$UpdateSongs? _$v;

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

  UpdateSongsBuilder();

  UpdateSongsBuilder get _$this {
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
  void replace(UpdateSongs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateSongs;
  }

  @override
  void update(void Function(UpdateSongsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UpdateSongs build() {
    final _$result = _$v ??
        new _$UpdateSongs._(
            songsByTags: BuiltValueNullFieldError.checkNotNull(
                songsByTags, 'UpdateSongs', 'songsByTags'),
            isLoadingMoreByTags: BuiltValueNullFieldError.checkNotNull(
                isLoadingMoreByTags, 'UpdateSongs', 'isLoadingMoreByTags'),
            isLoadedByTags: BuiltValueNullFieldError.checkNotNull(
                isLoadedByTags, 'UpdateSongs', 'isLoadedByTags'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
