import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../util.dart';
import 'effect.dart';
import 'tile/tile.dart';
import 'tile/tile_effect_spawner.dart';
import 'tile/tile_input_handler.dart';
import 'tile/tiles_controller.dart';

class MyGame extends Game with MultiTouchTapDetector {
  final _tilesController = TilesController();
  final _tileEffects = <Effect>[];
  var _state = _MyGameState.PREPARE;
  var _accumulator = 0.0;
  final _step = 1.0 / 60.0;
  final Map<int, _TouchPosition> _touches = {};
  Function(Tile tile) _onTouched;
  Function() _onCompleted;
  final _backgroundPaint = Paint()..color = backgroundColor;
  final _grayPaint = Paint()
    ..colorFilter = ColorFilter.mode(onBackgroundColor, BlendMode.srcIn);

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
        _TouchPosition(details.globalPosition.dx, details.globalPosition.dy);
  }

  @override
  void onTapUp(int pointerId, _) {
    _touches.remove(pointerId);
  }

  @override
  void render(Canvas canvas) {
    final rect = Rect.fromLTWH(0, 0, screenWidth, screenHeight);
    canvas.drawRect(rect, _backgroundPaint);
    _staffSprite.renderPosition(canvas, Position(0.0, pauseY - 96 + 24),
        size: Position(screenWidth, 96), overridePaint: _grayPaint);
    _clefSprite.renderPosition(canvas, Position(0.0, pauseY - 96 + 24),
        size: Position(96, 96), overridePaint: _grayPaint);
    _tilesController.render(canvas);
    _tileEffects.forEach((effect) {
      effect.render(canvas);
    });
  }

  @override
  void update(double delta) {
    // // FIXME Auto run
    // for (var i =0; i < _tilesController.tiles.length;i++) {
    //  final tile = _tilesController.tiles[i];
    //   if (tile != null && tile.y >= pauseY - 120) {
    //     _touches[i] = _TouchPosition(0, 0);
    //   } else {
    //     break;
    //   }
    // }
    _tileEffects.forEach((effect) {
      effect.update(delta);
    });
    _tileEffects.removeWhere((effect) => effect.isDone());
    if (_state != _MyGameState.STOP) {
      /* Max frame time to avoid spiral of death */
      final restrictedTime = (delta > 0.25) ? 0.25 : delta;
      _accumulator += restrictedTime;
      while (_accumulator >= _step) {
        var initialYAllowedTouch = double.negativeInfinity;
        _touches.forEach((key, value) {
              final tile = _tilesController.getNextUntouchedTile();
              if (tile != null) {
                if (tile.initialY >= initialYAllowedTouch) {
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
              } else {
                _onTouched(null);
              }
        });
        _touches.clear();
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

class _TouchPosition {
  final double x;
  final double y;

  _TouchPosition(this.x, this.y);
}
