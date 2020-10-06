import 'package:hitnotes/models/note.dart';
import 'package:meta/meta.dart';

class TileChunk {
  final List<Note> notes;
  final int durationToPrevious;
  final int startTick;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const TileChunk({
    @required this.notes,
    @required this.durationToPrevious,
    @required this.startTick,
  });

  TileChunk copyWith({
    List<Note> notes,
    int durationToPrevious,
    int startTick,
  }) {
    if ((notes == null || identical(notes, this.notes)) &&
        (durationToPrevious == null ||
            identical(durationToPrevious, this.durationToPrevious)) &&
        (startTick == null || identical(startTick, this.startTick))) {
      return this;
    }

    return new TileChunk(
      notes: notes ?? this.notes,
      durationToPrevious: durationToPrevious ?? this.durationToPrevious,
      startTick: startTick ?? this.startTick,
    );
  }

  @override
  String toString() {
    return 'TileChunk{notes: $notes, durationToPrevious: $durationToPrevious, startTick: $startTick}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TileChunk &&
          runtimeType == other.runtimeType &&
          notes == other.notes &&
          durationToPrevious == other.durationToPrevious &&
          startTick == other.startTick);

  @override
  int get hashCode =>
      notes.hashCode ^ durationToPrevious.hashCode ^ startTick.hashCode;

  factory TileChunk.fromMap(Map<String, dynamic> map) {
    return new TileChunk(
      notes: map['notes'] as List<Note>,
      durationToPrevious: map['durationToPrevious'] as int,
      startTick: map['startTick'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'notes': this.notes,
      'durationToPrevious': this.durationToPrevious,
      'startTick': this.startTick,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}