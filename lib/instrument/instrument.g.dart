// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instrument.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Instrument _$_$_InstrumentFromJson(Map<String, dynamic> json) {
  return _$_Instrument(
    json['id'] as String,
    (json['soundPaths'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(int.parse(k), e as String),
    ),
    (json['baseNotes'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(int.parse(k), e as int),
    ),
    json['minNote'] as int,
    json['maxNote'] as int,
  );
}

Map<String, dynamic> _$_$_InstrumentToJson(_$_Instrument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'soundPaths':
          instance.soundPaths.map((k, e) => MapEntry(k.toString(), e)),
      'baseNotes': instance.baseNotes.map((k, e) => MapEntry(k.toString(), e)),
      'minNote': instance.minNote,
      'maxNote': instance.maxNote,
    };
