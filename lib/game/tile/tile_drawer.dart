import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';

import '../../util.dart';
import 'tile.dart';

Sprite noteSprite =
    Sprite('${nearestDevicePixelRatioFolder}img_single_note.png');

extension TileDrawer on Tile {
  void render(Canvas canvas) {
    noteSprite.renderPosition(canvas,
        Position(positionsX[column].toInt().toDouble(), y.toInt().toDouble()),
        size: Position(width.toInt().toDouble(), height.toInt().toDouble()));
  }
}
