import 'package:flutter/services.dart';

class SoundPlayer {
  MethodChannel channel = MethodChannel('com.chaomao.hitnotes/sound_player');

  Future<void> init(int streamType, int maxStreams) {
    return channel.invokeMethod('init', <String, dynamic>{
      'streamType': streamType,
      'maxStreams': maxStreams,
    });
  }

  Future<int> load(String path, {int priority = 1}) {
    return channel.invokeMethod('load', <String, dynamic>{
      'path': path,
      'priority': priority,
    });
  }

  Future<int> play(int soundId, {int repeat = 0, double rate = 1.0}) {
    return channel.invokeMethod('play', <String, dynamic>{
      'soundId': soundId,
      'repeat': repeat,
      'rate': rate,
    });
  }

  Future<void> stop(int streamId) {
    return channel.invokeMethod('stop', <String, dynamic>{
      'streamId': streamId,
    });
  }

  Future<void> release() {
    return channel.invokeMethod('release');
  }
}
