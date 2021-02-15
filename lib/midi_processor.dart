import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'firebase_cache_manager.dart';
import 'instrument/instrument.dart';
import 'sound_player.dart';

class MidiProcessor {
  static MidiProcessor _instance;

  MidiProcessor._internal();

  static MidiProcessor getInstance() {
    _instance ??= MidiProcessor._internal();
    return _instance;
  }

  Instrument _instrument;

  final _soundPlayer = SoundPlayer();

  final _soundLoadedController = BehaviorSubject<bool>();

  Stream<bool> get soundLoadedStream => _soundLoadedController.stream;
  final _soundPaths = <int, String>{};

  void onSelectInstrument(Instrument instrument) {
    if (_instrument != instrument) {
      _soundPaths.clear();
      _soundPlayer.release();
      _soundLoadedController.add(false);
      _instrument = instrument;
      Future.wait(instrument.soundPaths
              .asMap()
              .map((note, path) => MapEntry(note, getFile(note, path)))
              .values
              .toList())
          .then((_) async {
        await _soundPlayer.load(_soundPaths, _instrument.baseNotes.toMap());
        _soundLoadedController.add(true);
      });
    }
  }

  Future<void> getFile(int note, String path) async {
    final file = await FirebaseCacheManager().getSingleFile(path);
    _soundPaths[note] = file.path;
  }

  Future<void> playNote(int note) async {
    print(note.toString());
    var pitchNote = note.toInt();
    while (pitchNote > _instrument.maxNote) {
      pitchNote -= 12;
    }
    while (pitchNote < _instrument.minNote) {
      pitchNote += 12;
    }
    await _soundPlayer.play(pitchNote);
  }
}
