class PitchNote {
  final int note;
  final double pitch;

  PitchNote({this.note, this.pitch});

  factory PitchNote.fromJson(Map<String, Object> json) {
    final a = (json['pitch'] is int)? (json['pitch'] as int).toDouble(): json['pitch'] as double;
    return PitchNote(note: json['note'] as int, pitch: a);
  }
}
