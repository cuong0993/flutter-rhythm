import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'songs_event.dart';
import 'songs_repository.dart';
import 'songs_state.dart';

class SongsBloc extends Bloc<SongsEvent, SongsState> {
  final SongsRepository _songsRepository;
  StreamSubscription _songsSubscription;

  SongsBloc({@required SongsRepository songsRepository})
      : assert(songsRepository != null),
        _songsRepository = songsRepository,
        super(SongsLoading());

  @override
  Stream<SongsState> mapEventToState(SongsEvent event) async* {
    if (event is LoadSongs) {
      yield* _mapLoadSongsToState();
    }
    if (event is SongsUpdated) {
      yield SongsLoaded(event.songs);
    }
  }

  Stream<SongsState> _mapLoadSongsToState() async* {
    await _songsSubscription?.cancel();
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
