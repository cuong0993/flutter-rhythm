import 'package:equatable/equatable.dart';
import 'package:hitnotes/models/song.dart';
import 'package:hitnotes/models/visibility_filter.dart';

abstract class FilteredSongsEvent extends Equatable {
  const FilteredSongsEvent();
}

class UpdateFilter extends FilteredSongsEvent {
  final VisibilityFilter filter;

  const UpdateFilter(this.filter);

  @override
  List<Object> get props => [filter];

  @override
  String toString() => 'UpdateFilter { filter: $filter }';
}

class UpdateSongs extends FilteredSongsEvent {
  final List<Song> songs;

  const UpdateSongs(this.songs);

  @override
  List<Object> get props => [songs];

  @override
  String toString() => 'UpdateSongs { songs: $songs }';
}
