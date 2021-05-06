import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase_cache_manager.dart';
import '../instrument/instrument.dart';
import '../sound_player.dart';

final midiProvider = StateNotifierProvider<MidiModel, bool>((ref) {
  return MidiModel();
});

class MidiModel extends StateNotifier<bool> {
  MidiModel() : super(false);

  var _maxNote = 0;
  var _minNote = 0;
  final _soundPlayer = SoundPlayer();
  final _soundPaths = <int, String>{};

  void changeInstrument(Instrument instrument) {
    _soundPaths.clear();
    _soundPlayer.release();
    state = false;
    _maxNote = instrument.maxNote;
    _minNote = instrument.minNote;
    Future.wait(instrument.soundPaths
            .asMap()
            .map((note, path) => MapEntry(note, _getFile(note, path)))
            .values
            .toList())
        .then((_) async {
      await _soundPlayer.load(_soundPaths, instrument.baseNotes.toMap());
      state = true;
    });
  }

  Future<void> _getFile(int note, String path) async {
    final file = await FirebaseCacheManager.getInstance().getSingleFile(path);
    _soundPaths[note] = file.path;
  }

  Future<void> playNote(int note) async {
    var pitchNote = note.toInt();
    while (pitchNote > _maxNote) {
      pitchNote -= 12;
    }
    while (pitchNote < _minNote) {
      pitchNote += 12;
    }
    await _soundPlayer.play(pitchNote);
  }
}