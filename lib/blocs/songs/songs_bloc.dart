import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hitnotes/repositories/songs_repository.dart';
import 'package:meta/meta.dart';

import 'songs_event.dart';
import 'songs_state.dart';

class SongsBloc extends Bloc<SongsEvent, SongsState> {
  final SongRepository _songsRepository;
  StreamSubscription _songsSubscription;

  SongsBloc({@required SongRepository songsRepository})
      : assert(songsRepository != null),
        _songsRepository = songsRepository,
        super(SongsLoading());

  @override
  Stream<SongsState> mapEventToState(SongsEvent event) async* {
    if (event is LoadSongs) {
      yield* _mapLoadSongsToState();
    }
  }

  Stream<SongsState> _mapLoadSongsToState() async* {
    _songsSubscription?.cancel();
    _songsSubscription = _songsRepository.songs().listen(
          (songs) => add(SongsUpdated(songs)),
        );
  }

  @override
  Future<void> close() {
    _songsSubscription?.cancel();
    return super.close();
  }
}
