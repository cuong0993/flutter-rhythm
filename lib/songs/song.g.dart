// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Song _$$_SongFromJson(Map<String, dynamic> json) => _$_Song(
      id: json['id'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String,
      url: json['url'] as String,
      bpm: json['bpm'] as int,
      unitDuration: json['unitDuration'] as int,
      tilesCount:
          (json['tilesCount'] as List<dynamic>).map((e) => e as int).toList(),
      duration:
          (json['duration'] as List<dynamic>).map((e) => e as int).toList(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_SongToJson(_$_Song instance) => <String, dynamic>{
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
