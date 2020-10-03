import 'dart:async';

import '../models/song.dart';

abstract class SongRepository {
  Stream<List<Song>> songs();
}
