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
  List<int> tilesCount;
  List<int> duration;
  List<String> tags;

  Song(
    this.id,
    this.title,
    this.artist,
    this.url,
    this.imageUrl,
    this.bpm,
    this.tilesCount,
    this.duration,
    this.tags,
  );

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

  Map<String, dynamic> toJson() => _$SongToJson(this);
}
