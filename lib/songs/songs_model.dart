import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'song.dart';
import 'songs_repository.dart';
import 'songs_repository_impl.dart';
import 'songs_state.dart';

const songTags = [
  'pop',
  'classic',
  'folk',
  'kpop',
  'other',
];

final songsProvider = StateNotifierProvider<SongsModel, SongsState>((ref) {
  return SongsModel(ref.read(songRepositoryProvider))
    ..loadMoreSongsByTagNumbers(songTags.asMap().keys.toList());
});

class SongsModel extends StateNotifier<SongsState> {
  SongsModel(this._songRepository) : super(SongsState.loading());

  final SongsRepository _songRepository;

  void loadMoreSongsByTagNumbers(List<int> tagNumbers) {
    final songsByTags = (state is SongsStateLoaded)
        ? (state as SongsStateLoaded).songsByTags
        : songTags.map((e) => <Song>[]).toList();
    final isLoadingMoreByTags = (state is SongsStateLoaded)
        ? (state as SongsStateLoaded).isLoadingMoreByTags
        : songTags.map((e) => false).toList();
    final isLoadedByTags = (state is SongsStateLoaded)
        ? (state as SongsStateLoaded).isLoadedByTags
        : songTags.map((e) => false).toList();

    tagNumbers.forEach((tag) async {
      if (!isLoadingMoreByTags[tag] && !isLoadedByTags[tag]) {
        isLoadingMoreByTags[tag] = true;
        state =
            SongsState.loaded(songsByTags, isLoadingMoreByTags, isLoadedByTags);
        final songs = await _songRepository.getSongsByTag(songTags[tag],
            songsByTags[tag].isEmpty ? '' : songsByTags[tag].last.title, 20);

        songsByTags[tag] += songs;
        isLoadingMoreByTags[tag] = false;
        isLoadedByTags[tag] = songs.isEmpty;
        state =
            SongsState.loaded(songsByTags, isLoadingMoreByTags, isLoadedByTags);
      }
    });
  }
}
