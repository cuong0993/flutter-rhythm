import 'song.dart';

abstract class SongsState {
  const SongsState();
}

class SongsInitial extends SongsState {
  const SongsInitial();
}

class SongsLoaded extends SongsState {
  final List<List<Song>> songsByTags;
  final List<bool> isLoadingMoreByTags;
  final List<bool> isLoadedByTags;

  const SongsLoaded(
      this.songsByTags, this.isLoadingMoreByTags, this.isLoadedByTags);
}
