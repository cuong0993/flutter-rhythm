import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hitnotes/blocs/game/constants.dart';
import 'package:hitnotes/blocs/game/tile.dart';
import 'package:hitnotes/blocs/game/tile_input_handler.dart';
import 'package:hitnotes/blocs/game/tiles_controller.dart';

class MyGame extends Game with MultiTouchTapDetector {
  final tilesController = TilesController();
  var state = MyGameState.PREPARE;
  var time = 0.0;
  var accumulator = 0.0;
  var step = 1.0 / 60.0;
  static const numberOfTouchPointers = 5; // 5 fingers
  final touches = () {
    final touches = List<TouchData>();
    for (int i = 0; i < numberOfTouchPointers; i++) {
      touches.add(TouchData());
    }
    return touches;
  }();

  _onTileTouched(Tile tile) {
    //tileEffects.addAll(tile.getEffects())
  }

  start(List<Tile> tiles, double speedPixelsPerSecond) {
    time = 0;
    tilesController.initialize(
        tiles, speedPixelsPerSecond, this._onTileTouched);
    state = MyGameState.PLAY;
  }

  void pause() {}

  @override
  void onTapDown(int pointerId, TapDownDetails details) {
    print("Tap down" + pointerId.toString());
  }

  @override
  void onTapUp(int pointerId, _) {
    print("Tap up" + pointerId.toString());
  }

  @override
  void render(Canvas canvas) {
    //print("Render");
    tilesController.render(canvas);
  }

  @override
  void update(double delta) {
    //print("update");

    if (state != MyGameState.STOP) {
      /* Max frame time to avoid spiral of death */
      final restrictedTime = (delta > 0.25) ? 0.25 : delta;
      accumulator += restrictedTime;
      while (accumulator >= step) {
        var initialYAllowedTouch = double.maxFinite;
        for (int i = 0; i < numberOfTouchPointers; i++) {
          if (touches[i].touched && !touches[i].handled) {
            touches[i].handled = true;
            if (touches[i].y > NON_TOUCH_REGION_HEIGHT) {
              final tile = tilesController.getNextUntouchedTile();
              if (tile != null) {
                if (tile.initialY <= initialYAllowedTouch) {
                  tile.touchDown();
                  if (state == MyGameState.PAUSE) {
                    state = MyGameState.PLAY;
                  }
                  //midiProcessor.playNote(tile.note);
                  // noteEventFlow.value = noteEventFlow.value + 1;
                  initialYAllowedTouch = tile.initialY;
                  if (tile.y == OFFSET_PAUSE_POSITION_Y) {
                    //infoEventFlow.value = "txt_too_late".get();
                  } else if (tile.y > OFFSET_PAUSE_POSITION_Y + SIZE_DP_120) {
                    //infoEventFlow.value = "txt_too_early".get()
                  }
                } else {
                  //infoEventFlow.value = "txt_too_many_fingers".get()
                }
                // rippleEffects[i] =
                //     RippleEffect(
                //         touches[i].x,
                //         SCREEN_HEIGHT.toInt() - touches[i].y
                //     )
              }
            }
          }
        }
        accumulator -= step;
        if (state == MyGameState.PLAY) {
          final actualDeltaTime = tilesController.tryUpdate(step);
          if (step > actualDeltaTime) {
            pause();
          }
          if (tilesController.tiles.isEmpty) {
            state = MyGameState.COMPLETE;
            onComplete();
          }
          time += actualDeltaTime;
          //timeEventChannel.offer(time);
        }
      }
    }
  }

  void onComplete() {}
}

enum MyGameState { PREPARE, PLAY, PAUSE, STOP, COMPLETE }

class TouchData {
  final touched = false;
  var handled = false;
  final x = 0;
  final y = 0;
}
