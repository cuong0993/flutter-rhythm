import 'package:meta/meta.dart';

class Note {
  final int note;
  final int startTick;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Note({
    @required this.note,
    @required this.startTick,
  });

  Note copyWith({
    int note,
    int startTick,
  }) {
    if ((note == null || identical(note, this.note)) &&
        (startTick == null || identical(startTick, this.startTick))) {
      return this;
    }

    return Note(
      note: note ?? this.note,
      startTick: startTick ?? this.startTick,
    );
  }

  @override
  String toString() {
    return 'Note{note: $note, startTick: $startTick}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          runtimeType == other.runtimeType &&
          note == other.note &&
          startTick == other.startTick);

  @override
  int get hashCode => note.hashCode ^ startTick.hashCode;

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      note: map['note'] as int,
      startTick: map['startTick'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'note': note,
      'startTick': startTick,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
