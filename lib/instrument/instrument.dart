import 'dart:collection';
import 'dart:core';

import 'pitch_note.dart';

class Instrument {
final String id;
final String title;
final String imageUrl;
final HashMap<int, String> soundFiles;
final HashMap<int, PitchNote> soundNotes;
final int minNote;
final int maxNote;
final double volume;
final int requiredLevel;

  Instrument(this.id, this.title, this.imageUrl, this.soundFiles, this.soundNotes, this.minNote, this.maxNote, this.volume, this.requiredLevel);
}