import 'package:freezed_annotation/freezed_annotation.dart';

import 'song.dart';

part 'songs_state.freezed.dart';

@freezed
class SongsState with _$SongsState {
  factory SongsState.loading() = SongsStateLoading;

  factory SongsState.loaded(
    List<List<Song>> songsByTags,
    List<bool> isLoadingMoreByTags,
    List<bool> isLoadedByTags,
  ) = SongsStateLoaded;
}
