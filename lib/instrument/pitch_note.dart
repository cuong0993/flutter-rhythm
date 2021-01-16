import 'package:json_annotation/json_annotation.dart';

part 'pitch_note.g.dart';

@JsonSerializable(explicitToJson: true)
class PitchNote {
  int note;
  double pitch;

  PitchNote(this.note, this.pitch);

  factory PitchNote.fromJson(Map<String, dynamic> json) =>
      _$PitchNoteFromJson(json);

  Map<String, dynamic> toJson() => _$PitchNoteToJson(this);
}
