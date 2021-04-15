import 'package:built_value/built_value.dart';

import 'song.dart';

part 'songs_state.g.dart';

abstract class SongsState {}

abstract class SongsInitial
    implements Built<SongsInitial, SongsInitialBuilder>, SongsState {
  factory SongsInitial([Function(SongsInitialBuilder) updates]) =
      _$SongsInitial;

  SongsInitial._();
}

abstract class SongsLoaded
    implements Built<SongsLoaded, SongsLoadedBuilder>, SongsState {
  factory SongsLoaded([Function(SongsLoadedBuilder) updates]) = _$SongsLoaded;

  SongsLoaded._();

  List<List<Song>> get songsByTags;

  List<bool> get isLoadingMoreByTags;

  List<bool> get isLoadedByTags;
}
