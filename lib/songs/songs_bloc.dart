import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';

import '../firebase_storage_cacher.dart';
import 'songs_event.dart';
import 'songs_repository.dart';
import 'songs_state.dart';

class SongsBloc extends Bloc<SongsEvent, SongsState> {
  final SongsRepository _songsRepository;
  var _lastSongTitle = '';
  var _isLoadedAllSongs = false;

  SongsBloc({@required SongsRepository songsRepository})
      : assert(songsRepository != null),
        _songsRepository = songsRepository,
        super(SongsInitial());

  @override
  Stream<SongsState> mapEventToState(SongsEvent event) async* {
    if (event is LoadMoreSongs) {
      if (!_isLoadedAllSongs) {
        if (state is SongsLoaded) {
          yield SongsLoaded((state as SongsLoaded).songs, true);
        }
        yield* _mapLoadMoreSongsToState();
      }
    }
    if (event is UpdateSongs) {
      yield SongsLoaded(event.songs, false);
    }
  }

  Stream<SongsState> _mapLoadMoreSongsToState() async* {
    final songs = await _songsRepository.songs(_lastSongTitle, 20);
    final downloadFutures = <Future>[];
    songs.map((e) => e.imageUrl).toSet().forEach((element) {
      downloadFutures.add(FirebaseStorage.instance.tryToSaveFile(element));
    });
    await Future.wait(downloadFutures);
    add(UpdateSongs(
        (state is SongsLoaded) ? (state as SongsLoaded).songs + songs : songs));
    if (songs.isNotEmpty) {
      _lastSongTitle = songs.last.title;
    } else {
      _isLoadedAllSongs = true;
    }
  }
}
