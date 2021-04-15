import 'package:built_value/built_value.dart';

import 'song.dart';

part 'songs_event.g.dart';

abstract class SongsEvent {}

abstract class LoadMoreSongsByTagNumbers
    implements
        Built<LoadMoreSongsByTagNumbers, LoadMoreSongsByTagNumbersBuilder>,
        SongsEvent {
  factory LoadMoreSongsByTagNumbers(
          [Function(LoadMoreSongsByTagNumbersBuilder) updates]) =
      _$LoadMoreSongsByTagNumbers;

  LoadMoreSongsByTagNumbers._();

  List<int> get tagNumbers;
}

abstract class UpdateSongs
    implements Built<UpdateSongs, UpdateSongsBuilder>, SongsEvent {
  factory UpdateSongs([Function(UpdateSongsBuilder) updates]) = _$UpdateSongs;

  UpdateSongs._();

  List<List<Song>> get songsByTags;

  List<bool> get isLoadingMoreByTags;

  List<bool> get isLoadedByTags;
}
