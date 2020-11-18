import 'dart:ui';

import 'package:flame/position.dart';
import 'package:flame/sprite.dart';

import '../util.dart';
import 'effect.dart';


class RippleEffect extends Effect {
  static Sprite touchSprite = Sprite('${nearestDevicePixelRatioFolder}img_touch.png');
  static const LIVE_TIME = 0.5;
  static const SIZE = 48;
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
    touchSprite.renderPosition(
        canvas, Position((_x - _width /2).toInt().toDouble(), (_y - _width/2).toInt().toDouble()),
        size: Position(_width.toInt().toDouble(), _width.toInt().toDouble()));
  }
}
