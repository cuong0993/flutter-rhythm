import 'package:equatable/equatable.dart';

import 'song.dart';

abstract class SongsState extends Equatable {
  const SongsState();
}

class SongsInitial extends SongsState {
  const SongsInitial();

  @override
  List<Object> get props => [];
}

class SongsLoaded extends SongsState {
  final List<Song> songs;
  final bool isLoadingMore;

  const SongsLoaded(this.songs, this.isLoadingMore);

  @override
  List<Object> get props => [songs, isLoadingMore];
}
