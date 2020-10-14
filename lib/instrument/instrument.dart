import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'pitch_note.dart';

class Instrument {
  final String id;
  final String title;
  final String imageUrl;
  final HashMap<String, String> soundFiles;
  final HashMap<String, PitchNote> soundNotes;
  final int minNote;
  final int maxNote;
  final double volume;
  final int requiredLevel;

  Instrument(
      {this.id,
      this.title,
      this.imageUrl,
      this.soundFiles,
      this.soundNotes,
      this.minNote,
      this.maxNote,
      this.volume,
      this.requiredLevel});

  factory Instrument.fromDocumentSnapshot(DocumentSnapshot event) {

    final a= event.data()['soundFiles'];
    return Instrument(
        id: event.data()['id'],
        title: event.data()['title'],
        imageUrl: event.data()['imageUrl'],
        soundFiles: HashMap.from(event.data()['soundFiles']),
        soundNotes: HashMap.from(event.data()['soundNotes']),
        minNote: event.data()['minNote'],
        maxNote: event.data()['maxNote'],
        volume: event.data()['volume'],
        requiredLevel: event.data()['requiredLevel']);
  }
}
