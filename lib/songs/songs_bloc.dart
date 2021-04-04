import 'dart:async';

import 'package:bloc/bloc.dart';

import '../main.dart';
import 'song.dart';
import 'songs_event.dart';
import 'songs_repository.dart';
import 'songs_state.dart';

class SongsBloc extends Bloc<SongsEvent, SongsState> {
  final SongsRepository _songsRepository;

  SongsBloc({required SongsRepository songsRepository})
      : _songsRepository = songsRepository,
        super(const SongsInitial());

  @override
  Stream<SongsState> mapEventToState(SongsEvent event) async* {
    if (event is LoadMoreSongsByTagNumbers) {
      yield* _mapLoadMoreSongsToState(event);
    }
    if (event is UpdateSongs) {
      yield SongsLoaded(
          event.songsByTags, event.isLoadingMoreByTags, event.isLoadedByTags);
    }
  }

  Stream<SongsState> _mapLoadMoreSongsToState(
      LoadMoreSongsByTagNumbers event) async* {
    final songsByTags = (state is SongsLoaded)
        ? (state as SongsLoaded).songsByTags
        : songTags.map((e) => <Song>[]).toList();
    final isLoadingMoreByTags = (state is SongsLoaded)
        ? (state as SongsLoaded).isLoadingMoreByTags
        : songTags.map((e) => false).toList();
    final isLoadedByTags = (state is SongsLoaded)
        ? (state as SongsLoaded).isLoadedByTags
        : songTags.map((e) => false).toList();

    event.tagNumbers.forEach((tag) async {
      if (!isLoadingMoreByTags[tag] && !isLoadedByTags[tag]) {
        isLoadingMoreByTags[tag] = true;
        add(UpdateSongs(songsByTags, isLoadingMoreByTags, isLoadedByTags));
        final songs = await _songsRepository.songsByTag(songTags[tag],
            songsByTags[tag].isEmpty ? '' : songsByTags[tag].last.title, 20);

        songsByTags[tag] += songs;
        isLoadingMoreByTags[tag] = false;
        isLoadedByTags[tag] = songs.isEmpty;
        add(UpdateSongs(songsByTags, isLoadingMoreByTags, isLoadedByTags));
      }
    });
  }
}
