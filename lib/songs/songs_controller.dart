import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'song.dart';
import 'songs_repository_impl.dart';

const songTags = [
  'pop',
  'classic',
  'folk',
  'kpop',
  'other',
];

final isLoadingNextPageByTagProvider =
    StateProvider.family<bool, String>((_, __) => false);
final isLoadedByTagsProvider =
    StateProvider.family<bool, String>((_, __) => false);

final songsByTagProvider = StateNotifierProvider.family<
    SongsController,
    AsyncValue<List<Song>>,
    String>((ref, tag) => SongsController(ref.read, tag));

class SongsController extends StateNotifier<AsyncValue<List<Song>>> {
  SongsController(this._read, this._tag) : super(const AsyncValue.loading()) {
    _read(songRepositoryProvider)
        .getSongsByTag(_tag, '', 20)
        .then((songs) => {state = AsyncValue.data(songs)});
  }

  final String _tag;
  final Reader _read;

  Future<void> loadMoreSongs() async {
    final isLoading = _read(isLoadingNextPageByTagProvider(_tag).state).state;
    final isLoaded = _read(isLoadedByTagsProvider(_tag).state).state;
    if (!isLoading && !isLoaded) {
      _read(isLoadingNextPageByTagProvider(_tag).state).state = true;
      final titleStart = state.when(
        data: (songs) => songs.isEmpty ? '' : songs.last.title,
        loading: () => '',
        error: (_, __) => '',
      );
      final loadedSongs = state.when(
        data: (songs) => songs,
        loading: () => <Song>[],
        error: (_, __) => <Song>[],
      );
      final songs = await _read(songRepositoryProvider)
          .getSongsByTag(_tag, titleStart, 20);
      _read(isLoadingNextPageByTagProvider(_tag).state).state = false;
      _read(isLoadedByTagsProvider(_tag).state).state = songs.isEmpty;
      state = AsyncValue.data(loadedSongs + songs);
    }
  }
}
