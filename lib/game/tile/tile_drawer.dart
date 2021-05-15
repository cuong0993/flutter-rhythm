import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../util.dart';
import 'tile.dart';

Sprite noteSprite = Sprite(Flame.images
    .fromCache('${nearestDevicePixelRatioFolder}img_single_note.png'));

extension TileDrawer on Tile {
  void render(Canvas canvas) {
    noteSprite.render(canvas,
        position: Vector2(
            positionsX[column].toInt().toDouble(), y.toInt().toDouble()),
        size: Vector2(width.toInt().toDouble(), height.toInt().toDouble()),
        overridePaint: paint);
  }
}
