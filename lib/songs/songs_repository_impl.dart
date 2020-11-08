import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'song.dart';
import 'songs_repository.dart';

class SongsRepositoryImpl implements SongsRepository {
  @override
  Future<List<Song>> songs(String titleStart, int limit) async {
    return (await FirebaseFirestore.instance
            .collection('songs')
            .orderBy('title')
            .startAfter([titleStart])
            .limit(limit)
            .get())
        .docs
        .map((e) => Song.fromJson(e.data()))
        .toList();
  }

  @override
  Future<List<Song>> searchSongs(String text) async {
    return (await FirebaseFirestore.instance
            .collection('songs')
            .where('title', isGreaterThanOrEqualTo: text)
            .where('title', isLessThanOrEqualTo: text + '\uf8ff')
            .get())
        .docs
        .map((e) => Song.fromJson(e.data()))
        .toList();
  }
}
