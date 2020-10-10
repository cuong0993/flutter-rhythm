import 'package:flame/game.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyGame extends BaseGame with HasWidgetsOverlay, MultiTouchTapDetector {
  MyGame() {
    addWidgetOverlay(
        'PauseMenu',
        Container(
            width: 500,
            height: 100,
            child:  AppBar(
              title: Text("aaaaaaaaaaaaaaaaaa"),
            ),
          ),
        );
  }
  void pause() {}


  @override
  void onTapDown(int pointerId, TapDownDetails details) {
    print("Tap down" + pointerId.toString());
    //print(details.toString());
  }

  @override
  void onTapUp(int pointerId, _) {
    print("Tap up" + pointerId.toString());
    // addWidgetOverlay(
    //     'PauseMenu',
    //     Center(
    //       child: Container(
    //         width: 100,
    //         height: 100,
    //         color: const Color(0xFFFF0000),
    //         child: const Center(child: const Text('Paused')),
    //       ),
    //     ));
  }

  @override
  void update(double t) {
    super.update(t);
    //print(t.toString());
  }

  @override
  bool recordFps() => true;
}
