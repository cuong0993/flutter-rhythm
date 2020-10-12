import 'dart:async';

import 'song.dart';

abstract class SongRepository {
  Stream<List<Song>> songs();
}
