import 'package:equatable/equatable.dart';

import 'song.dart';

abstract class SongsState extends Equatable {
  const SongsState();

  @override
  List<Object> get props => [];
}

class SongsLoading extends SongsState {}

class SongsLoaded extends SongsState {
  final List<Song> songs;

  const SongsLoaded([this.songs = const []]);

  @override
  List<Object> get props => [songs];

  @override
  String toString() => 'Loaded { items: $songs }';
}
