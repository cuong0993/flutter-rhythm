import 'package:json_annotation/json_annotation.dart';

import 'pitch_note.dart';

part 'instrument.g.dart';

@JsonSerializable(explicitToJson: true)
class Instrument {
  String id;
  Map<int, String> soundFiles;
  Map<int, PitchNote> soundNotes;
  int minNote;
  int maxNote;
  double volume;

  Instrument(
      this.id,
      this.soundFiles,
      this.soundNotes,
      this.minNote,
      this.maxNote,
      this.volume);

  factory Instrument.fromJson(Map<String, dynamic> json) =>
      _$InstrumentFromJson(json);

  Map<String, dynamic> toJson() => _$InstrumentToJson(this);
}
