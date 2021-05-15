import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.freezed.dart';
part 'song.g.dart';

@freezed
class Song with _$Song {
  factory Song(
    String id,
    String title,
    String artist,
    String url,
    int bpm,
    int unitDuration,
    List<int> tilesCount,
    List<int> duration,
    List<String> tags,
  ) = _Song;

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
}
