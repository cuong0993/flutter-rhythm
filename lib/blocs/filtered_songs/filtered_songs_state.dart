import 'package:equatable/equatable.dart';
import 'package:hitnotes/models/song.dart';
import 'package:hitnotes/models/visibility_filter.dart';

abstract class FilteredSongsState extends Equatable {
  const FilteredSongsState();

  @override
  List<Object> get props => [];
}

class FilteredSongsLoading extends FilteredSongsState {}

class FilteredSongsLoaded extends FilteredSongsState {
  final List<Song> filteredSongs;
  final VisibilityFilter activeFilter;

  const FilteredSongsLoaded(
    this.filteredSongs,
    this.activeFilter,
  );

  @override
  List<Object> get props => [filteredSongs, activeFilter];

  @override
  String toString() {
    return 'FilteredSongsLoaded { filteredSongs: $filteredSongs, activeFilter: $activeFilter }';
  }
}
