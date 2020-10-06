import 'package:equatable/equatable.dart';
import 'package:hitnotes/models/song.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class StartGame extends GameEvent {
  final Song song;

  const StartGame(this.song);

  @override
  List<Object> get props => [song];

  @override
  String toString() => 'StartGame { song: $song }';
}

class AddSong extends GameEvent {
  final Song song;

  const AddSong(this.song);

  @override
  List<Object> get props => [song];

  @override
  String toString() => 'AddSong { song: $song }';
}

class UpdateSong extends GameEvent {
  final Song updatedSong;

  const UpdateSong(this.updatedSong);

  @override
  List<Object> get props => [updatedSong];

  @override
  String toString() => 'UpdateSong { updatedSong: $updatedSong }';
}

class DeleteSong extends GameEvent {
  final Song song;

  const DeleteSong(this.song);

  @override
  List<Object> get props => [song];

  @override
  String toString() => 'DeleteSong { song: $song }';
}

class ClearCompleted extends GameEvent {}

class ToggleAll extends GameEvent {}

class GameUpdated extends GameEvent {
  final List<Song> songs;

  const GameUpdated(this.songs);

  @override
  List<Object> get props => [songs];
}
