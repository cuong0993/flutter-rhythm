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
  static const liveTime = 0.5;
  static const size = 96;
  static const initialWidth = 0.5 * size;
  double _width;
  final double _rate;
  var _time = 0.0;
  var _isDone = false;
  final double _x;
  final double _y;

  RippleEffect(this._x, this._y)
      : _rate = (size - initialWidth) / liveTime,
        _width = initialWidth;

  @override
  bool isDone() {
    return _isDone;
  }

  @override
  void update(double delta) {
    _time += delta;
    _width = initialWidth + _rate * _time;

    if (_time > liveTime) {
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
