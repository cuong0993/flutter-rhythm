import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'pitch_note.dart';

class Instrument {
  final String id;
  final String title;
  final String imageUrl;
  final Map<String, String> soundFiles;
  final Map<String, PitchNote> soundNotes;
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
        soundNotes: (event.data()['soundNotes'] as Map<String, dynamic>).map((key, value) => MapEntry(key, PitchNote.fromJson(value))),
        minNote: event.data()['minNote'],
        maxNote: event.data()['maxNote'],
        volume: event.data()['volume'],
        requiredLevel: event.data()['requiredLevel']);
  }
}
