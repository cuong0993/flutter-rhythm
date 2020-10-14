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

  final noteToSoundPathAndPitchMap = HashMap<int, Pair<String, double>>();
  Instrument instrument;

  /*
    Limit the number of simultaneous sounds, because, SoundPool only have 1MB heap size (media/libmediaplayerservice/MediaPlayerService.cpp), if exceeded, sound cannot be played.
    AudioFlinger could not create track, status: -12
    SoundPool: Error creating AudioTrack
    (Error -12 out of memory)
    */
  final maxStreams = 8;

  // private val soundPool = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
  // val audioAttributes = AudioAttributes.Builder()
  //     .setUsage(AudioAttributes.USAGE_GAME)
  //     .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
  //     .build()
  // SoundPool.Builder().setAudioAttributes(audioAttributes).setMaxStreams(maxStreams).build()
  // } else {
  // @Suppress("DEPRECATION")
  // (SoundPool(maxStreams, AudioManager.STREAM_MUSIC, 0))
  // }

  final pool = Soundpool(streamType: StreamType.music);

  // int soundId = await rootBundle.load("sounds/dices.m4a").then((ByteData soundData) {
  // return pool.load(soundData);
  // });
  // int streamId = await pool.play(soundId);

  HashMap<String, int> soundPathToSoundIdMap;
  LinkedHashSet<int> activeSounds;
  var numberOfLoadedSound = 0;

  //private val soundLoadedFlow = MutableStateFlow(false)

  void onSelectInstrument(Instrument instrument) {
    this.instrument = instrument;
    dispose();
    final soundFiles = instrument.soundFiles;
    final serverFilePathToCacheFilePaths = HashMap<String, String>();
    soundFiles.forEach((key, serverFilePath) {
      final cacheFilePath = serverFilePath.toLocalFilePath();
      serverFilePathToCacheFilePaths[serverFilePath] = cacheFilePath;
    });

    instrument.soundNotes.forEach((key, value) {
      final a = serverFilePathToCacheFilePaths[soundFiles[value.note]];
      if (serverFilePathToCacheFilePaths[soundFiles[value.note]] != null) {
        noteToSoundPathAndPitchMap[key] = Pair(a, value.pitch);
      }
    });
    final soundPaths = serverFilePathToCacheFilePaths.values;
    // pool.setOnLoadCompleteListener { _, sampleId, status ->
    // if (status != 0) {
    // logger.e("Failed ${soundPathToSoundIdMap.filterValues { it == sampleId }.keys} $status")
    // }
    // numberOfLoadedSound++;
    // if (numberOfLoadedSound == soundPaths.size) {
    // soundLoadedFlow.value = true
    // }
    // }
    final soundIdFutures = <Future>[];
    soundPaths.forEach((path) {
      soundIdFutures.add(pool.loadUri(path));
      });
    Future.wait(soundIdFutures).then((value) =>
    {
      value.asMap().forEach((key, value) {
        soundPathToSoundIdMap[soundPaths.elementAt(key)] = value;
        numberOfLoadedSound++;
        if (numberOfLoadedSound == soundPaths.length) {
          //soundLoadedFlow.value = true
        }
      })
    });
  }


  //override fun getSoundLoadedFlow(): StateFlow<Boolean> = soundLoadedFlow

  void playNote(int note) {
    print(note.toString());
    var pitchNote = note.toInt();
    while (pitchNote > instrument.maxNote) {
      pitchNote -= 12;
    }
    while (pitchNote < instrument.minNote) {
      pitchNote += 12;
    }
    noteToSoundPathAndPitchMap[pitchNote.toByte()]?.let {
      val soundId = soundPathToSoundIdMap[it.first]
      if (soundId != null) {
        activeSounds.add(soundPool.play(soundId, 1.0f, 1.0f, 0, 0, it.second))
        if (activeSounds.size == maxStreams) {
          soundPool.stop(dequeue(activeSounds))
        }
      }
    }
  }

  void dispose() {
    for (sound in soundPathToSoundIdMap) {
      soundPool.unload(sound.value)
    }
    numberOfLoadedSound = 0
    soundLoadedFlow.value = false
    soundPathToSoundIdMap.clear()
    activeSounds.clear()
    noteToSoundPathAndPitchMap.clear()
  }

// private fun <T> dequeue(iterable: MutableIterable<T>): T {
// val it = iterable.iterator()
// val next = it.next()
// it.remove()
// return next
// }
}

class Pair<A, B> {
  final A first;
  final B second;

  const Pair(this.first, this.second);
}