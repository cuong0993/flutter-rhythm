import 'dart:async';

import 'song.dart';

abstract class SongsRepository {
  Future<List<Song>> getSongsByTag(String tag, String titleStart, int limit);

  Future<List<Song>> searchSongs(String text);
}
