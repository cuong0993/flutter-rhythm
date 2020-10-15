import 'package:json_annotation/json_annotation.dart';

part 'song.g.dart';

@JsonSerializable(explicitToJson: true)
class Song {
  String id;
  String title;
  String artist;
  String url;
  String imageUrl;
  int bpm;
  int tilesCount;
  int coins;

  Song(
    this.id,
    this.title,
    this.artist,
    this.url,
    this.imageUrl,
    this.bpm,
    this.tilesCount,
    this.coins,
  );

  factory PitchNote.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

  Map<String, dynamic> toJson() => _$SongToJson(this);
}
