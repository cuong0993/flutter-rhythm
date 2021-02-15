import 'package:flutter/services.dart';

class SoundPlayer {
  MethodChannel channel = MethodChannel('com.chaomao.hitnotes/sound_player');

  Future<void> load(Map<int, String> soundPaths, Map<int, int> baseNotes) {
    print('load');
    return channel.invokeMethod('load',
        <String, dynamic>{'soundPaths': soundPaths, 'baseNotes': baseNotes});
  }

  Future<void> play(int note) {
    print('play $note');
    return channel.invokeMethod('play', <String, dynamic>{'note': note});
  }

  Future<void> release() {
    print('release');
    return channel.invokeMethod('release');
  }
}
