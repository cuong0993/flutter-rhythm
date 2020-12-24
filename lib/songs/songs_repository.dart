import 'dart:async';

import 'song.dart';

abstract class SongsRepository {
  Future<List<Song>> songsByTag(String tag, String titleStart, int limit);

  Future<List<Song>> searchSongs(String text);
}
