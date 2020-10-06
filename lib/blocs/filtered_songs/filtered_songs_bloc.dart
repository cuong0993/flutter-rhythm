import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hitnotes/blocs/songs/songs_bloc.dart';
import 'package:hitnotes/blocs/songs/songs_state.dart';
import 'package:hitnotes/models/models.dart';
import 'package:hitnotes/models/song.dart';
import 'package:meta/meta.dart';

import 'filtered_songs_event.dart';
import 'filtered_songs_state.dart';

class FilteredSongsBloc extends Bloc<FilteredSongsEvent, FilteredSongsState> {
  final SongsBloc _songsBloc;
  StreamSubscription _songsSubscription;

  FilteredSongsBloc({@required SongsBloc songsBloc})
      : assert(songsBloc != null),
        _songsBloc = songsBloc,
        super(songsBloc.state is SongsLoaded
            ? FilteredSongsLoaded(
                (songsBloc.state as SongsLoaded).songs,
                VisibilityFilter.all,
              )
            : FilteredSongsLoading()) {
    _songsSubscription = songsBloc.listen((state) {
      if (state is SongsLoaded) {
        add(UpdateSongs((songsBloc.state as SongsLoaded).songs));
      }
    });
  }

  @override
  Stream<FilteredSongsState> mapEventToState(FilteredSongsEvent event) async* {
    if (event is UpdateFilter) {
      yield* _mapUpdateFilterToState(event);
    } else if (event is UpdateSongs) {
      yield* _mapSongsUpdatedToState(event);
    }
  }

  Stream<FilteredSongsState> _mapUpdateFilterToState(
    UpdateFilter event,
  ) async* {
    final currentState = _songsBloc.state;
    if (currentState is SongsLoaded) {
      yield FilteredSongsLoaded(
        _mapSongsToFilteredSongs(currentState.songs, event.filter),
        event.filter,
      );
    }
  }

  Stream<FilteredSongsState> _mapSongsUpdatedToState(
    UpdateSongs event,
  ) async* {
    final visibilityFilter = state is FilteredSongsLoaded
        ? (state as FilteredSongsLoaded).activeFilter
        : VisibilityFilter.all;
    yield FilteredSongsLoaded(
      _mapSongsToFilteredSongs(
        (_songsBloc.state as SongsLoaded).songs,
        visibilityFilter,
      ),
      visibilityFilter,
    );
  }

  List<Song> _mapSongsToFilteredSongs(
      List<Song> songs, VisibilityFilter filter) {
    return songs.where((song) {
      if (filter == VisibilityFilter.all) {
        return true;
      } else if (filter == VisibilityFilter.active) {
        return true;
      } else {
        return true;
      }
    }).toList();
  }

  @override
  Future<void> close() {
    _songsSubscription?.cancel();
    return super.close();
  }
}
