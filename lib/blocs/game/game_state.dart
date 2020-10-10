import 'package:equatable/equatable.dart';
import 'package:hitnotes/models/song.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

class GameLoading extends GameState {}

class GameLoaded extends GameState {
  final List<Song> songs;

  const GameLoaded([this.songs = const []]);

  @override
  List<Object> get props => [songs];

  @override
  String toString() => 'Loaded { items: $songs }';
}

class GameNotLoaded extends GameState {}
