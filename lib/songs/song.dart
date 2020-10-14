import 'package:cloud_firestore/cloud_firestore.dart';

class Song {
  final String id;
  final String title;
  final String artist;
  final String url;
  final String imageUrl;
  final int bpm;
  final int tilesCount;
  final int coins;

  Song({
    this.id,
    this.title,
    this.artist,
    this.url,
    this.imageUrl,
    this.bpm,
    this.tilesCount,
    this.coins,
  });

  factory Song.fromDocumentSnapshot(DocumentSnapshot event) {
    return Song(
        id: event.data()['id'],
        title: event.data()['title'],
        artist: event.data()['artist'],
        url: event.data()['url'],
        imageUrl: event.data()['imageUrl'],
        bpm: event.data()['bpm'],
        tilesCount: event.data()['tilesCount'],
        coins: event.data()['coins']);
  }
}
