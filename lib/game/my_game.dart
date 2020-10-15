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
  var _accumulator = 0.0;
  final _step = 1.0 / 60.0;
  final Map<int, _TouchData> _touches = {};
  Function(Tile tile) onTouched;

  void _onTileTouched(Tile tile) {
    onTouched(tile);
  }

  void start(List<Tile> tiles, double speedPixelsPerSecond,
      Function(Tile tile) onTouched) {
    _tilesController.initialize(tiles, speedPixelsPerSecond);
    _state = _MyGameState.PLAY;
    this.onTouched = onTouched;
  }

  void pause() {}

  @override
  void onTapDown(int pointerId, TapDownDetails details) {
    _touches[pointerId] =
        _TouchData(details.globalPosition.dx, details.globalPosition.dy);
  }

  @override
  void onTapUp(int pointerId, _) {
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
                  _onTileTouched(tile);
                  if (_state == _MyGameState.PAUSE) {
                    _state = _MyGameState.PLAY;
                  }
                  initialYAllowedTouch = tile.initialY;
                } else {
                  _onTileTouched(null);
                }
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
