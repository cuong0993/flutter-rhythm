import 'dart:async';
import 'dart:collection';

import 'package:soundpool/soundpool.dart';

import 'firebase_storage_cacher.dart';
import 'instrument/instrument.dart';

class MidiProcessor {
  static MidiProcessor _instance;

  MidiProcessor._internal();

  static MidiProcessor getInstance() {
    _instance ??= MidiProcessor._internal();
    return _instance;
  }

  final _noteToSoundPathAndPitchMap = HashMap<int, Pair<String, double>>();
  Instrument _instrument;

  /*
    Limit the number of simultaneous sounds, because, SoundPool only have 1MB heap size (media/libmediaplayerservice/MediaPlayerService.cpp), if exceeded, sound cannot be played.
    AudioFlinger could not create track, status: -12
    SoundPool: Error creating AudioTrack
    (Error -12 out of memory)
    */
  final _maxStreams = 8;
  final _soundPool = Soundpool(streamType: StreamType.music);
  HashMap<String, int> _soundPathToSoundIdMap;
  LinkedHashSet<int> _activeSounds;
  var _numberOfLoadedSound = 0;

  final _soundLoadedController = StreamController<bool>();

  Stream<bool> get soundLoaded => _soundLoadedController.stream;

  void onSelectInstrument(Instrument instrument) {
    _instrument = instrument;
    dispose();
    final soundFiles = instrument.soundFiles;
    final serverFilePathToCacheFilePaths = HashMap<String, String>();
    soundFiles.forEach((key, serverFilePath) {
      final cacheFilePath = serverFilePath.toLocalFilePath();
      serverFilePathToCacheFilePaths[serverFilePath] = cacheFilePath;
    });

    instrument.soundNotes.forEach((key, pitchNote) {
      final cacheFilePath =
          serverFilePathToCacheFilePaths[soundFiles[pitchNote.note]];
      if (cacheFilePath != null) {
        _noteToSoundPathAndPitchMap[key] = Pair(cacheFilePath, pitchNote.pitch);
      }
    });
    final soundPaths = serverFilePathToCacheFilePaths.values;
    final soundIdFutures = <Future>[];
    soundPaths.forEach((path) {
      soundIdFutures.add(_soundPool.loadUri(path));
    });
    Future.wait(soundIdFutures).then((soundIds) => {
          soundIds.asMap().forEach((key, soundId) {
            _soundPathToSoundIdMap[soundPaths.elementAt(key)] = soundId;
            _numberOfLoadedSound++;
            if (_numberOfLoadedSound == soundPaths.length) {
              _soundLoadedController.add(true);
            }
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
    final soundPathAndPitch = _noteToSoundPathAndPitchMap[pitchNote];
    if (soundPathAndPitch != null) {
      final soundId = _soundPathToSoundIdMap[soundPathAndPitch.first];
      if (soundId != null) {
        _activeSounds.add(
            await _soundPool.play(soundId, rate: soundPathAndPitch.second));
        if (_activeSounds.length == _maxStreams) {
          final firstSound = _activeSounds.first;
          await _soundPool.stop(firstSound);
          _activeSounds.remove(firstSound);
        }
      }
    }
  }

  void dispose() {
    _soundPool.release();
    _numberOfLoadedSound = 0;
    _soundLoadedController.add(false);
    _soundLoadedController.close();
    _soundPathToSoundIdMap.clear();
    _activeSounds.clear();
    _noteToSoundPathAndPitchMap.clear();
  }
}

class Pair<A, B> {
  final A first;
  final B second;

  const Pair(this.first, this.second);
}
