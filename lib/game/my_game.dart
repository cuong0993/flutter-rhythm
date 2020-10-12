import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'game_util.dart';
import 'tile/tile.dart';
import 'tile/tile_input_handler.dart';
import 'tile/tiles_controller.dart';

class MyGame extends Game with MultiTouchTapDetector {
  final _tilesController = TilesController();
  var _state = _MyGameState.PREPARE;
  double _time = 0.0;
  var _accumulator = 0.0;
  final _step = 1.0 / 60.0;
  static const _numberOfTouchPointers = 5; // 5 fingers
  final Map<int, _TouchData> _touches = {};
  Function(Tile tile) onTouched;

  void _onTileTouched(Tile tile) {
    //tileEffects.addAll(tile.getEffects())
    onTouched(tile);
  }

  void start(List<Tile> tiles, double speedPixelsPerSecond, Function(Tile tile) onTouched) {
    _time = 0;
    _tilesController.initialize(tiles, speedPixelsPerSecond, _onTileTouched);
    _state = _MyGameState.PLAY;
    this.onTouched = onTouched;
  }

  void pause() {}

  @override
  void onTapDown(int pointerId, TapDownDetails details) {
    //print('Tap down' + pointerId.toString());
    _touches[pointerId] =
        _TouchData(details.globalPosition.dx, details.globalPosition.dy);
  }

  @override
  void onTapUp(int pointerId, _) {
    //print('Tap up' + pointerId.toString());
    _touches.remove(pointerId);
  }

  @override
  void render(Canvas canvas) {
    _tilesController.render(canvas);
  }

  @override
  void update(double delta) {
    if (_state != _MyGameState.STOP) {
      /* Max frame time to avoid spiral of death */
      final restrictedTime = (delta > 0.25) ? 0.25 : delta;
      _accumulator += restrictedTime;
      while (_accumulator >= _step) {
        var initialYAllowedTouch = double.maxFinite;
        _touches.forEach((key, value) {
          if (!value.handled) {
            value.handled = true;
            if (value.y > NON_TOUCH_REGION_HEIGHT) {
              final tile = _tilesController.getNextUntouchedTile();
              if (tile != null) {
                if (tile.initialY <= initialYAllowedTouch) {
                  tile.touchDown();
                  if (_state == _MyGameState.PAUSE) {
                    _state = _MyGameState.PLAY;
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
        });
        _accumulator -= _step;
        if (_state == _MyGameState.PLAY) {
          final actualDeltaTime = _tilesController.tryUpdate(_step);
          if (_step > actualDeltaTime) {
            pause();
          }
          if (_tilesController.tiles.isEmpty) {
            _state = _MyGameState.COMPLETE;
            onComplete();
          }
          _time += actualDeltaTime;
          //timeEventChannel.offer(time);
        }
      }
    }
  }

  void onComplete() {}
}

enum _MyGameState { PREPARE, PLAY, PAUSE, STOP, COMPLETE }

class _TouchData {
  final touched = true;
  bool handled = false;
  final double x;
  final double y;

  _TouchData(this.x, this.y);
}
