// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Song _$_$_SongFromJson(Map<String, dynamic> json) {
  return _$_Song(
    json['id'] as String,
    json['title'] as String,
    json['artist'] as String,
    json['url'] as String,
    json['bpm'] as int,
    json['unitDuration'] as int,
    (json['tilesCount'] as List<dynamic>).map((e) => e as int).toList(),
    (json['duration'] as List<dynamic>).map((e) => e as int).toList(),
    (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$_$_SongToJson(_$_Song instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artist': instance.artist,
      'url': instance.url,
      'bpm': instance.bpm,
      'unitDuration': instance.unitDuration,
      'tilesCount': instance.tilesCount,
      'duration': instance.duration,
      'tags': instance.tags,
    };
