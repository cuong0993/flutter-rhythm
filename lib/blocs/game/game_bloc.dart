import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hitnotes/repositories/songs_repository.dart';
import 'package:meta/meta.dart';

import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final SongRepository _songsRepository;
  StreamSubscription _songsSubscription;

  GameBloc({@required SongRepository songsRepository})
      : assert(songsRepository != null),
        _songsRepository = songsRepository,
        super(GameLoading());

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {
    if (event is LoadGame) {
      yield* _mapLoadGameToState();
    }
    if (event is GameUpdated) {
      yield GameLoaded(event.songs);
    }
  }

  Stream<GameState> _mapLoadGameToState() async* {
    _songsSubscription?.cancel();
    _songsSubscription = _songsRepository.songs().listen(
          (songs) => add(GameUpdated(songs)),
        );
  }

  @override
  Future<void> close() {
    _songsSubscription?.cancel();
    return super.close();
  }
}
