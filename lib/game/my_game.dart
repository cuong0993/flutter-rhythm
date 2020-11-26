import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../util.dart';
import 'effect.dart';
import 'ripple_effect.dart';
import 'tile/tile.dart';
import 'tile/tile_converter.dart';
import 'tile/tile_effect_spawner.dart';
import 'tile/tile_input_handler.dart';
import 'tile/tiles_controller.dart';

class MyGame extends Game with MultiTouchTapDetector {
  final _tilesController = TilesController();
  final _tileEffects = <Effect>[];
  final _rippleEffects = <int, Effect>{};
  var _state = _MyGameState.PREPARE;
  var _accumulator = 0.0;
  final _step = 1.0 / 60.0;
  final Map<int, _TouchData> _touches = {};
  Function(Tile tile) _onTouched;
  Function() _onCompleted;
  final _paint = Paint()..color = Color(0xFF1F1929);
  final _grayPaint = Paint()
    ..colorFilter =
        ColorFilter.mode(Color(0xFFFFFFFF).withOpacity(0.2), BlendMode.srcIn);

  final _staffSprite = Sprite('${nearestDevicePixelRatioFolder}img_staff.png');
  final _clefSprite = Sprite('${nearestDevicePixelRatioFolder}img_clef.png');

  void start(List<Tile> tiles, double speedPixelsPerSecond,
      Function(Tile tile) onTouched, Function() onCompleted) async {
    _tilesController.initialize(tiles, speedPixelsPerSecond);
    _state = _MyGameState.PLAY;
    _onTouched = onTouched;
    _onCompleted = onCompleted;
    _accumulator = 0.0;
  }

  void pause() {}

  @override
  void onTapDown(int pointerId, TapDownDetails details) {
    _touches[pointerId] =
        _TouchData(details.globalPosition.dx, details.globalPosition.dy);
    _rippleEffects[pointerId] =
        RippleEffect(details.globalPosition.dx, details.globalPosition.dy);
  }

  @override
  void onTapUp(int pointerId, _) {
    _touches.remove(pointerId);
  }

  @override
  void render(Canvas canvas) {
    final rect = Rect.fromLTWH(0, 0, screenWidth, screenHeight);
    canvas.drawRect(rect, _paint);
    _staffSprite.renderPosition(canvas, Position(0.0, pauseY - 96 + 24),
        size: Position(screenWidth, 96), overridePaint: _grayPaint);
    _clefSprite.renderPosition(canvas, Position(0.0, pauseY - 96 + 24),
        size: Position(96, 96), overridePaint: _grayPaint);
    _tilesController.render(canvas);
    _tileEffects.forEach((effect) {
      effect.render(canvas);
    });
    _rippleEffects.forEach((key, effect) {
      effect.render(canvas);
    });
  }

  @override
  void update(double delta) {
    _tileEffects.forEach((effect) {
      effect.update(delta);
    });
    _tileEffects.removeWhere((effect) => effect.isDone());
    _rippleEffects.forEach((key, effect) {
      effect.update(delta);
    });
    _rippleEffects.removeWhere((key, effect) => effect.isDone());
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
                  _tileEffects.addAll(tile.getEffects());
                  _onTouched(tile);
                  if (_state == _MyGameState.PAUSE) {
                    _state = _MyGameState.PLAY;
                  }
                  initialYAllowedTouch = tile.initialY;
                } else {
                  _onTouched(null);
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
            _onCompleted();
          }
        }
      }
    }
  }
}

enum _MyGameState { PREPARE, PLAY, PAUSE, STOP, COMPLETE }

class _TouchData {
  final touched = true;
  bool handled = false;
  final double x;
  final double y;

  _TouchData(this.x, this.y);
}
