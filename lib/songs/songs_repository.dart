import 'dart:async';

import 'song.dart';

abstract class SongsRepository {
  Future<List<Song>> songs(String titleStart, int limit);
  Future<List<Song>> searchSongs(String text);
}
