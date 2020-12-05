// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) {
  return Song(
    json['id'] as String,
    json['title'] as String,
    json['artist'] as String,
    json['url'] as String,
    json['imageUrl'] as String,
    json['bpm'] as int,
    (json['tilesCount'] as List)?.map((e) => e as int)?.toList(),
    (json['duration'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artist': instance.artist,
      'url': instance.url,
      'imageUrl': instance.imageUrl,
      'bpm': instance.bpm,
      'tilesCount': instance.tilesCount,
      'duration': instance.duration,
    };
