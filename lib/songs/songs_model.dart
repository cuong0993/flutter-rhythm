import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../main.dart';
import 'song.dart';
import 'songs_repository.dart';
import 'songs_repository_impl.dart';
import 'songs_state.dart';

final songsStateProvider = StateNotifierProvider<SongsModel, SongsState>((ref) {
  return SongsModel(ref.read(songRepositoryProvider))
    ..loadMoreSongsByTagNumbers(songTags.asMap().keys.toList());
});

class SongsModel extends StateNotifier<SongsState> {
  SongsModel(this._songRepository) : super(SongsInitial());

  final SongsRepository _songRepository;

  void loadMoreSongsByTagNumbers(List<int> tagNumbers) {
    final songsByTags = (state is SongsLoaded)
        ? (state as SongsLoaded).songsByTags
        : songTags.map((e) => <Song>[]).toList();
    final isLoadingMoreByTags = (state is SongsLoaded)
        ? (state as SongsLoaded).isLoadingMoreByTags
        : songTags.map((e) => false).toList();
    final isLoadedByTags = (state is SongsLoaded)
        ? (state as SongsLoaded).isLoadedByTags
        : songTags.map((e) => false).toList();

    tagNumbers.forEach((tag) async {
      if (!isLoadingMoreByTags[tag] && !isLoadedByTags[tag]) {
        isLoadingMoreByTags[tag] = true;
        state = SongsLoaded((b) => b
          ..songsByTags = songsByTags
          ..isLoadingMoreByTags = isLoadingMoreByTags
          ..isLoadedByTags = isLoadedByTags);
        final songs = await _songRepository.getSongsByTag(songTags[tag],
            songsByTags[tag].isEmpty ? '' : songsByTags[tag].last.title, 20);

        songsByTags[tag] += songs;
        isLoadingMoreByTags[tag] = false;
        isLoadedByTags[tag] = songs.isEmpty;
        state = SongsLoaded((b) => b
          ..songsByTags = songsByTags
          ..isLoadingMoreByTags = isLoadingMoreByTags
          ..isLoadedByTags = isLoadedByTags);
      }
    });
  }
}
