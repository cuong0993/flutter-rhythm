import 'package:equatable/equatable.dart';

import 'song.dart';

abstract class SongsEvent extends Equatable {
  const SongsEvent();

  @override
  List<Object> get props => [];
}

class LoadMoreSongs extends SongsEvent {}

class UpdateSongs extends SongsEvent {
  final List<Song> songs;

  const UpdateSongs(this.songs);

  @override
  List<Object> get props => [songs];
}
