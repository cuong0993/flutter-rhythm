import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'effect.dart';
import 'tile/tile.dart';
import 'tile/tile_effect_spawner.dart';
import 'tile/tile_input_handler.dart';
import 'tile/tiles_controller.dart';
import 'util.dart';

class MyGame extends Game with MultiTouchTapDetector {
  final _tilesController = TilesController();
  final _tileEffects = <Effect>[];
  var _state = _MyGameState.prepare;
  var _accumulator = 0.0;
  final _step = 1.0 / 60.0;
  final Map<int, _TouchPosition> _touches = {};
  late Function(Tile? tile) _onTouched;
  late Function() _onCompleted;
  final _backgroundPaint = Paint()..color = backgroundColor;
  final _grayPaint = Paint()
    ..colorFilter = ColorFilter.mode(onBackgroundColor, BlendMode.srcIn);

  late Sprite _staffSprite;
  late Sprite _clefSprite;

  Future<void> start(List<Tile> tiles, double speedPixelsPerSecond,
      Function(Tile? tile) onTouched, Function() onCompleted) async {
    _tilesController.initialize(tiles, speedPixelsPerSecond);
    _state = _MyGameState.play;
    _onTouched = onTouched;
    _onCompleted = onCompleted;
    _accumulator = 0.0;
  }

  @override
  Future<void> onLoad() async {
    _staffSprite = Sprite(
        await images.load('${nearestDevicePixelRatioFolder}img_staff.png'));
    _clefSprite = Sprite(
        await images.load('${nearestDevicePixelRatioFolder}img_clef.png'));
    await Flame.images.load('${nearestDevicePixelRatioFolder}img_touch.png');
    await Flame.images
        .load('${nearestDevicePixelRatioFolder}img_single_note.png');
  }

  void pause() {}

  @override
  void onTapDown(int pointerId, TapDownInfo info) {
    _touches[pointerId] =
        _TouchPosition(info.raw.globalPosition.dx, info.raw.globalPosition.dy);
  }

  @override
  void onTapUp(int pointerId, TapUpInfo info) {
    _touches.remove(pointerId);
  }

  @override
  void render(Canvas canvas) {
    final rect = Rect.fromLTWH(0, 0, screenWidth, screenHeight);
    canvas.drawRect(rect, _backgroundPaint);
    _staffSprite.render(canvas,
        position: Vector2(0.0, pauseY - 96 + 24),
        size: Vector2(screenWidth, 96),
        overridePaint: _grayPaint);
    _clefSprite.render(canvas,
        position: Vector2(0.0, pauseY - 96 + 24),
        size: Vector2(96, 96),
        overridePaint: _grayPaint);
    _tilesController.render(canvas);
    for (final effect in _tileEffects) {
      effect.render(canvas);
    }
  }

  @override
  void update(double dt) {
    // // FIXME Auto run
    // for (var i =0; i < _tilesController.tiles.length;i++) {
    //  final tile = _tilesController.tiles[i];
    //   if (tile != null && tile.y >= pauseY - 120) {
    //     _touches[i] = _TouchPosition(0, 0);
    //   } else {
    //     break;
    //   }
    // }
    for (final effect in _tileEffects) {
      effect.update(dt);
    }
    _tileEffects.removeWhere((effect) => effect.isDone());
    if (_state != _MyGameState.stop) {
      /* Max frame time to avoid spiral of death */
      final restrictedTime = (dt > 0.25) ? 0.25 : dt;
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
              if (_state == _MyGameState.pause) {
                _state = _MyGameState.play;
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
        if (_state == _MyGameState.play) {
          final actualDeltaTime = _tilesController.tryUpdate(_step);
          if (_step > actualDeltaTime) {
            pause();
          }
          if (_tilesController.tiles.isEmpty) {
            _state = _MyGameState.complete;
            _onCompleted();
          }
        }
      }
    }
  }
}

enum _MyGameState { prepare, play, pause, stop, complete }

class _TouchPosition {
  final double x;
  final double y;

  _TouchPosition(this.x, this.y);
}
