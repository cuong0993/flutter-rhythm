import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../serializers.dart';
import 'song.dart';
import 'songs_repository.dart';

class SongsRepositoryImpl implements SongsRepository {
  @override
  Future<List<Song>> getSongsByTag(
      String tag, String titleStart, int limit) async {
    return (await FirebaseFirestore.instance
            .collection('songs')
            .orderBy('title')
            .where('tags', arrayContains: tag)
            .startAfter(<String>[titleStart])
            .limit(limit)
            .get())
        .docs
        .map((e) => serializers.deserializeWith<Song>(
            Song.serializer, e.data() as Object)!)
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
        .map((e) => serializers.deserializeWith<Song>(
            Song.serializer, e.data() as Object)!)
        .toList();
  }
}
