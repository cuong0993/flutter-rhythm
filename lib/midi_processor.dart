import 'dart:async';

import 'package:flutter_cache_manager_firebase/flutter_cache_manager_firebase.dart';
import 'package:soundpool/soundpool.dart';

import 'instrument/instrument.dart';

class MidiProcessor {
  static MidiProcessor _instance;

  MidiProcessor._internal();

  static MidiProcessor getInstance() {
    _instance ??= MidiProcessor._internal();
    return _instance;
  }

  Map<int, Pair<int, double>> _noteToSoundIdAndPitches;
  Instrument _instrument;

  /*
    Limit the number of simultaneous sounds, because, SoundPool only have 1MB heap size (media/libmediaplayerservice/MediaPlayerService.cpp), if exceeded, sound cannot be played.
    AudioFlinger could not create track, status: -12
    SoundPool: Error creating AudioTrack
    (Error -12 out of memory)
    */
  final _maxStreams = 8;
  final _soundPool = Soundpool(streamType: StreamType.music);

  final _activeSounds = <int>{};

  final _soundLoadedController = StreamController<bool>();

  Stream<bool> get soundLoaded => _soundLoadedController.stream;

  void onSelectInstrument(Instrument instrument) {
    _instrument = instrument;
    dispose();
    Future.wait(
            instrument.soundFiles.values
                .map((e) => FirebaseCacheManager().getSingleFile(e)))
        .then((files) => {
              Future.wait(files.map((file) => _soundPool.loadPath(file.path)))
                  .then((soundIds) => {
                        _noteToSoundIdAndPitches = _instrument.soundNotes.map(
                            (note, pitchNote) => MapEntry(
                                note,
                                Pair(
                                    soundIds[_instrument.soundFiles.keys
                                        .toList()
                                        .indexOf(pitchNote.note)],
                                    pitchNote.pitch))),
                        if (soundIds.length == _instrument.soundFiles.length)
                          {_soundLoadedController.add(true)}
                      })
            });
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
    final soundIdAndPitch = _noteToSoundIdAndPitches[pitchNote];
    if (soundIdAndPitch != null) {
      _activeSounds.add(await _soundPool.play(soundIdAndPitch.first,
          rate: soundIdAndPitch.second));
      if (_activeSounds.length == _maxStreams) {
        final firstSound = _activeSounds.first;
        await _soundPool.stop(firstSound);
        _activeSounds.remove(firstSound);
      }
    }
  }

  void dispose() {
    _soundPool.release();
    _soundLoadedController.add(false);
    //_soundLoadedController.close();
    _activeSounds.clear();
    // _noteToSoundIdAndPitches.clear();
  }
}

class Pair<A, B> {
  final A first;
  final B second;

  const Pair(this.first, this.second);
}
