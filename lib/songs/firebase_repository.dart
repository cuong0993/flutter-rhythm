import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'entity.dart';
import 'repository.dart';
import 'song.dart';

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
