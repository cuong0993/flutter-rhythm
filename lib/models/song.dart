import 'package:meta/meta.dart';

// Generated by https://github.com/andrasferenczi/dart-data-plugin
class Song {
  final String id;
  final String title;
  final String artist;
  final String url;
  final String imageUrl;
  final int bpm;
  final int tilesCount;
  final int coins;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Song({
    @required this.id,
    @required this.title,
    @required this.artist,
    @required this.url,
    @required this.imageUrl,
    @required this.bpm,
    @required this.tilesCount,
    @required this.coins,
  });

  Song copyWith({
    String id,
    String title,
    String artist,
    String url,
    String imageUrl,
    int bpm,
    int tilesCount,
    int coins,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (title == null || identical(title, this.title)) &&
        (artist == null || identical(artist, this.artist)) &&
        (url == null || identical(url, this.url)) &&
        (imageUrl == null || identical(imageUrl, this.imageUrl)) &&
        (bpm == null || identical(bpm, this.bpm)) &&
        (tilesCount == null || identical(tilesCount, this.tilesCount)) &&
        (coins == null || identical(coins, this.coins))) {
      return this;
    }

    return new Song(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      url: url ?? this.url,
      imageUrl: imageUrl ?? this.imageUrl,
      bpm: bpm ?? this.bpm,
      tilesCount: tilesCount ?? this.tilesCount,
      coins: coins ?? this.coins,
    );
  }

  @override
  String toString() {
    return 'Song{id: $id, title: $title, artist: $artist, url: $url, imageUrl: $imageUrl, bpm: $bpm, tilesCount: $tilesCount, coins: $coins}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Song &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          artist == other.artist &&
          url == other.url &&
          imageUrl == other.imageUrl &&
          bpm == other.bpm &&
          tilesCount == other.tilesCount &&
          coins == other.coins);

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      artist.hashCode ^
      url.hashCode ^
      imageUrl.hashCode ^
      bpm.hashCode ^
      tilesCount.hashCode ^
      coins.hashCode;

  factory Song.fromMap(Map<String, dynamic> map) {
    return new Song(
      id: map['id'] as String,
      title: map['title'] as String,
      artist: map['artist'] as String,
      url: map['url'] as String,
      imageUrl: map['imageUrl'] as String,
      bpm: map['bpm'] as int,
      tilesCount: map['tilesCount'] as int,
      coins: map['coins'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'title': this.title,
      'artist': this.artist,
      'url': this.url,
      'imageUrl': this.imageUrl,
      'bpm': this.bpm,
      'tilesCount': this.tilesCount,
      'coins': this.coins,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
