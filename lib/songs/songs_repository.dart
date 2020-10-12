import 'dart:async';

import 'song.dart';

abstract class SongsRepository {
  Stream<List<Song>> songs();
}
