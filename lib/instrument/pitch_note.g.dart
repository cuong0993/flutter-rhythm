// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pitch_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PitchNote _$PitchNoteFromJson(Map<String, dynamic> json) {
  return PitchNote(
    json['note'] as int,
    (json['pitch'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$PitchNoteToJson(PitchNote instance) => <String, dynamic>{
      'note': instance.note,
      'pitch': instance.pitch,
    };
