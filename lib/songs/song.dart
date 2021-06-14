import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.freezed.dart';
part 'song.g.dart';

@freezed
class Song with _$Song {
  factory Song({
    required String id,
    required String title,
    required String artist,
    required String url,
    required int bpm,
    required int unitDuration,
    required List<int> tilesCount,
    required List<int> duration,
    required List<String> tags,
  }) = _Song;

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
}
