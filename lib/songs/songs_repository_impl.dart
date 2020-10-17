import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'song.dart';
import 'songs_repository.dart';

class SongsRepositoryImpl implements SongsRepository {
  final _songsCollection = FirebaseFirestore.instance.collection('songs');

  @override
  Future<List<Song>> songs(String titleStart, int limit) async {
    return (await _songsCollection
            .orderBy('title')
            .startAfter([titleStart])
            .limit(limit)
            .get())
        .docs
        .map((e) => Song.fromJson(e.data()))
        .toList();
  }
}
