import 'dart:ui';

import 'package:hitnotes/blocs/game/constants.dart';
import 'package:hitnotes/blocs/game/tile.dart';
import 'package:hitnotes/blocs/game/tile_drawer.dart';
import 'package:hitnotes/blocs/game/tile_updater.dart';

class TilesController {
  var visibleTileCount = 0;
  double deltaY = 0;
  double speedPixelsPerSecond = 0;
  var tiles = List<Tile>();
  Function(Tile tile) onTileTouched;

  initialize(List<Tile> tiles, double speedPixelsPerSecond,
      Function(Tile tile) onTouched) {
    this.speedPixelsPerSecond = speedPixelsPerSecond;
    visibleTileCount = 0;
    deltaY = 0;
    this.onTileTouched = onTouched;
  }

  double tryUpdate(double delta) {
    tryToMakeTilesVisible();
    final maxDeltaTime = getMaxDeltaY() / speedPixelsPerSecond;
    final actualDelta = (delta >= maxDeltaTime) ? maxDeltaTime : delta;

    this.deltaY += speedPixelsPerSecond * actualDelta;
    for (int i = 0; i < visibleTileCount; i++) {
      tiles[i].updateY(deltaY);
    }
    return actualDelta;
  }

  tryToMakeTilesVisible() {
    var end = 0;
    final iterator = tiles.iterator;
    while (iterator.moveNext()) {
      final tile = iterator.current;
      if (tile.state == TileState.TOUCHED) {
        visibleTileCount--;
        end++;
      } else {
        break;
      }
    }
    tiles.removeRange(0, end);
    for (int i = 0; i < visibleTileCount && i < tiles.length; i++) {
      final tile = tiles[i];
      if (tile.initialY - deltaY <= START_VISIBLE_POSITION_Y) {
        tile.y = tile.initialY - deltaY;
        tile.onTouched = onTileTouched;
        visibleTileCount += 1;
      } else {
        break;
      }
    }
  }

  double getMaxDeltaY() {
    return tiles
            .firstWhere((element) => element.state == TileState.UNTOUCHED,
                orElse: () => Tile(0, 0, 0))
            .y -
        OFFSET_PAUSE_POSITION_Y;
  }

  Tile getNextUntouchedTile() {
    for (int i = 0; i < visibleTileCount; i++) {
      final tile = tiles[i];
      if (tile.state == TileState.UNTOUCHED) {
        return tile;
      }
    }
    return null;
  }

  draw(Canvas canvas) {
    for (int i = 0; i < visibleTileCount; i++) {
      tiles[i].draw(canvas);
    }
  }
}
