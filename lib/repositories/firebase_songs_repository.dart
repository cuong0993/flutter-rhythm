import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hitnotes/models/song_entity.dart';

import '../models/song.dart';
import 'songs_repository.dart';

class FirebaseSongRepository implements SongRepository {
  final songCollection = FirebaseFirestore.instance.collection('songs');

  @override
  Stream<List<Song>> songs() {
    return songCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => SongEntity.fromEntity(SongEntity.fromSnapshot(doc)))
          .toList();
    });
  }
}
