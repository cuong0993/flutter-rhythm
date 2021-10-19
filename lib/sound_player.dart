import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

class SoundPlayer {
  MethodChannel channel =
      const MethodChannel('com.chaomao.hitnotes/sound_player');

  Future<void> load(Map<int, String> soundPaths, Map<int, int> baseNotes) {
    Logger.root.info('SoundPlayer load');
    return channel.invokeMethod(
      'load',
      <String, dynamic>{
        'soundPaths': soundPaths,
        'baseNotes': baseNotes,
      },
    );
  }

  Future<void> play(int note) {
    Logger.root.info('SoundPlayer play $note');
    return channel.invokeMethod('play', <String, dynamic>{'note': note});
  }

  Future<void> release() {
    Logger.root.info('SoundPlayer release');
    return channel.invokeMethod('release');
  }
}
