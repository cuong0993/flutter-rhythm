import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'song.dart';
import 'songs_repository.dart';

class SongsRepositoryImpl implements SongsRepository {
  final _songsCollection = FirebaseFirestore.instance.collection('songs');

  @override
  Stream<List<Song>> songs() {
    // FIXME
    return _songsCollection.limit(2).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Song.fromJson(doc.data())).toList();
    });
  }
}
