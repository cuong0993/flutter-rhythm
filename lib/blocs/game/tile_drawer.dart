import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:hitnotes/blocs/game/tile.dart';

Sprite block = Sprite('2.0x/img_single_note.png');

extension TileDrawer on Tile {
  void draw(Canvas canvas) {
    block.renderPosition(
        canvas, Position(x.toInt().toDouble(), y.toInt().toDouble()),
        size: Position(width.toInt().toDouble(), height.toInt().toDouble()));
  }
}
