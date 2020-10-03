import 'package:equatable/equatable.dart';
import 'package:hitnotes/models/song.dart';

abstract class SongsEvent extends Equatable {
  const SongsEvent();

  @override
  List<Object> get props => [];
}

class LoadSongs extends SongsEvent {}

class AddSong extends SongsEvent {
  final Song song;

  const AddSong(this.song);

  @override
  List<Object> get props => [song];

  @override
  String toString() => 'AddSong { song: $song }';
}

class UpdateSong extends SongsEvent {
  final Song updatedSong;

  const UpdateSong(this.updatedSong);

  @override
  List<Object> get props => [updatedSong];

  @override
  String toString() => 'UpdateSong { updatedSong: $updatedSong }';
}

class DeleteSong extends SongsEvent {
  final Song song;

  const DeleteSong(this.song);

  @override
  List<Object> get props => [song];

  @override
  String toString() => 'DeleteSong { song: $song }';
}

class ClearCompleted extends SongsEvent {}

class ToggleAll extends SongsEvent {}

class SongsUpdated extends SongsEvent {
  final List<Song> songs;

  const SongsUpdated(this.songs);

  @override
  List<Object> get props => [songs];
}
