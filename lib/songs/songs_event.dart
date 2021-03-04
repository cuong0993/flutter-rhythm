import 'package:equatable/equatable.dart';

import 'song.dart';

abstract class SongsEvent extends Equatable {
  const SongsEvent();

  @override
  List<Object?> get props => [];
}

class LoadMoreSongsByTagNumbers extends SongsEvent {
  final List<int> tagNumbers;

  LoadMoreSongsByTagNumbers(this.tagNumbers);
}

class UpdateSongs extends SongsEvent {
  final List<List<Song>> songsByTags;
  final List<bool> isLoadingMoreByTags;
  final List<bool> isLoadedByTags;

  const UpdateSongs(
      this.songsByTags, this.isLoadingMoreByTags, this.isLoadedByTags);

  @override
  List<Object?> get props => [songsByTags, isLoadingMoreByTags, isLoadedByTags];
}
