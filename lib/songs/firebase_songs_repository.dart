import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'song.dart';
import 'song_entity.dart';
import 'songs_repository.dart';

class FirebaseSongRepository implements SongRepository {
  final songCollection = FirebaseFirestore.instance.collection('songs');

  @override
  Stream<List<Song>> songs() {
    return songCollection.limit(2).snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => SongEntity.fromEntity(SongEntity.fromSnapshot(doc)))
          .toList();
    });
  }
}
