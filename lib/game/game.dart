import 'package:flame/game/base_game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';

class MyGame extends BaseGame with MultiTouchTapDetector {
  MyGame();

  @override
  void onTapDown(int pointerId, TapDownDetails details) {
    print("Tap down" + pointerId.toString());
    //print(details.toString());
  }

  @override
  void onTapUp(int pointerId, _) {
    print("Tap up" + pointerId.toString());
  }

  @override
  void update(double t) {
    super.update(t);
    //print(t.toString());
  }

  @override
  bool recordFps() => true;
}
