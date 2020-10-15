// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instrument.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Instrument _$InstrumentFromJson(Map<String, dynamic> json) {
  return Instrument(
    json['id'] as String,
    json['title'] as String,
    json['imageUrl'] as String,
    (json['soundFiles'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), e as String),
    ),
    (json['soundNotes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k),
          e == null ? null : PitchNote.fromJson(e as Map<String, dynamic>)),
    ),
    json['minNote'] as int,
    json['maxNote'] as int,
    (json['volume'] as num)?.toDouble(),
    json['requiredLevel'] as int,
  );
}

Map<String, dynamic> _$InstrumentToJson(Instrument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'soundFiles':
          instance.soundFiles?.map((k, e) => MapEntry(k.toString(), e)),
      'soundNotes': instance.soundNotes
          ?.map((k, e) => MapEntry(k.toString(), e?.toJson())),
      'minNote': instance.minNote,
      'maxNote': instance.maxNote,
      'volume': instance.volume,
      'requiredLevel': instance.requiredLevel,
    };
