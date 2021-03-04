import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

import '../main.dart';
import '../util.dart';
import 'effect.dart';

Sprite touchSprite = Sprite(
    Flame.images.fromCache('${nearestDevicePixelRatioFolder}img_touch.png'));
Paint paint = Paint()
  ..colorFilter =
      ColorFilter.mode(primaryColor.withOpacity(0.1), BlendMode.srcIn);

class RippleEffect extends Effect {
  static const LIVE_TIME = 0.5;
  static const SIZE = 96;
  final initialWidth = 0.5 * SIZE;
  var _width;
  var _rate;
  var _time = 0.0;
  var _isDone = false;
  final _x;
  final _y;

  RippleEffect(this._x, this._y) {
    _rate = (SIZE - initialWidth) / LIVE_TIME;
    _width = initialWidth;
  }

  @override
  bool isDone() {
    return _isDone;
  }

  @override
  void update(double delta) {
    _time += delta;
    _width = initialWidth + _rate * _time;

    if (_time > LIVE_TIME) {
      _isDone = true;
    }
  }

  @override
  void render(Canvas canvas) {
    touchSprite.render(canvas,
        position: Vector2((_x - _width / 2).toInt().toDouble(),
            (_y - _width / 2).toInt().toDouble()),
        size: Vector2(_width.toInt().toDouble(), _width.toInt().toDouble()),
        overridePaint: paint);
  }
}
