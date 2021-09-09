// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instrument.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Instrument _$$_InstrumentFromJson(Map<String, dynamic> json) =>
    _$_Instrument(
      id: json['id'] as String,
      soundPaths: (json['soundPaths'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ),
      baseNotes: (json['baseNotes'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as int),
      ),
      minNote: json['minNote'] as int,
      maxNote: json['maxNote'] as int,
    );

Map<String, dynamic> _$$_InstrumentToJson(_$_Instrument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'soundPaths':
          instance.soundPaths.map((k, e) => MapEntry(k.toString(), e)),
      'baseNotes': instance.baseNotes.map((k, e) => MapEntry(k.toString(), e)),
      'minNote': instance.minNote,
      'maxNote': instance.maxNote,
    };
