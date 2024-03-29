import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase_cache_manager.dart';
import '../instrument/instrument.dart';
import '../instrument/instruments_controller.dart';
import '../sound_player.dart';

final midiLoadedProvider = StateNotifierProvider<MidiController, bool>((ref) {
  final selectedInstrument = ref.watch(selectedInstrumentProvider);
  final controller = MidiController();
  if (selectedInstrument != null) {
    controller._loadSound(selectedInstrument);
  }

  return controller;
});

class MidiController extends StateNotifier<bool> {
  MidiController() : super(false);

  var _maxNote = 0;
  var _minNote = 0;
  final _soundPlayer = SoundPlayer();
  final _soundPaths = <int, String>{};

  void _loadSound(Instrument instrument) {
    _soundPlayer.release();
    _maxNote = instrument.maxNote;
    _minNote = instrument.minNote;
    Future.wait(
      instrument.soundPaths
          .map((note, path) => MapEntry(note, _getFile(note, path)))
          .values
          .toList(),
    ).then((_) async {
      await _soundPlayer.load(_soundPaths, instrument.baseNotes);
      state = true;
    });
  }

  Future<void> _getFile(int note, String path) async {
    final file = await FirebaseCacheManager.getInstance().getSingleFile(path);
    _soundPaths[note] = file.path;
  }

  Future<void> playNote(int note) async {
    var pitchNote = note;
    while (pitchNote > _maxNote) {
      pitchNote -= 12;
    }
    while (pitchNote < _minNote) {
      pitchNote += 12;
    }
    await _soundPlayer.play(pitchNote);
  }
}
