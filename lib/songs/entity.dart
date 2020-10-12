import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'song.dart';

class SongEntity extends Equatable {
  final String id;
  final String title;
  final String artist;
  final String url;
  final String imageUrl;
  final int bpm;
  final int tilesCount;
  final int coins;

  const SongEntity(
    this.id,
    this.title,
    this.artist,
    this.url,
    this.imageUrl,
    this.bpm,
    this.tilesCount,
    this.coins,
  );

  Map<String, Object> toJson() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'url': url,
      'imageUrl': imageUrl,
      'bpm': bpm,
      'tilesCount': tilesCount,
      'coins': coins,
    };
  }

  @override
  List<Object> get props =>
      [id, title, artist, url, imageUrl, bpm, tilesCount, coins];

  @override
  String toString() {
    return 'SongEntity{id: $id, title: $title, artist: $artist, url: $url, imageUrl: $imageUrl, bpm: $bpm, tilesCount: $tilesCount, coins: $coins}';
  }

  static SongEntity fromJson(Map<String, Object> json) {
    return SongEntity(
        json['id'] as String,
        json['title'] as String,
        json['artist'] as String,
        json['url'] as String,
        json['imageUrl'] as String,
        json['bpm'] as int,
        json['tilesCount'] as int,
        json['coins'] as int);
  }

  static SongEntity fromSnapshot(DocumentSnapshot snap) {
    return SongEntity(
        snap.data()['id'],
        snap.data()['title'],
        snap.data()['artist'],
        snap.data()['url'],
        snap.data()['imageUrl'],
        snap.data()['bpm'],
        snap.data()['tilesCount'],
        snap.data()['coins']);
  }

  Map<String, Object> toDocument() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'url': url,
      'imageUrl': imageUrl,
      'bpm': bpm,
      'tilesCount': tilesCount,
      'coins': coins,
    };
  }

  static Song fromEntity(SongEntity entity) {
    return Song(
        id: entity.id,
        title: entity.title,
        artist: entity.artist,
        url: entity.url,
        imageUrl: entity.imageUrl,
        bpm: entity.bpm,
        tilesCount: entity.tilesCount,
        coins: entity.coins);
  }
}
