import 'dart:ui';

import '../game_util.dart';
import 'tile.dart';
import 'tile_drawer.dart';
import 'tile_updater.dart';

class TilesController {
  var _visibleTileCount = 0;
  double _deltaY = 0;
  double _speedPixelsPerSecond = 0;
  var tiles = <Tile>[];
  Function(Tile tile) _onTileTouched;

  void initialize(List<Tile> tiles, double speedPixelsPerSecond,
      Function(Tile tile) onTouched) {
    _speedPixelsPerSecond = speedPixelsPerSecond;
    _visibleTileCount = 0;
    _deltaY = 0;
    _onTileTouched = onTouched;
    this.tiles = tiles;
  }

  double tryUpdate(double delta) {
    _tryToMakeTilesVisible();
    final maxDeltaTime = _getMaxDeltaY() / _speedPixelsPerSecond;
    final actualDelta = (delta >= maxDeltaTime) ? maxDeltaTime : delta;

    _deltaY += _speedPixelsPerSecond * actualDelta;
    for (var i = 0; i < _visibleTileCount; i++) {
      tiles[i].updateY(_deltaY);
    }
    return actualDelta;
  }

  void _tryToMakeTilesVisible() {
    var end = 0;
    final iterator = tiles.iterator;
    while (iterator.moveNext()) {
      final tile = iterator.current;
      if (tile.state == TileState.TOUCHED) {
        _visibleTileCount--;
        end++;
      } else {
        break;
      }
    }
    tiles.removeRange(0, end);
    for (var i = _visibleTileCount; i < tiles.length; i++) {
      final tile = tiles[i];
      if (tile.initialY - _deltaY <= startVisibleY) {
        tile.y = tile.initialY - _deltaY;
        tile.onTouched = _onTileTouched;
        _visibleTileCount += 1;
      } else {
        break;
      }
    }
  }

  double _getMaxDeltaY() {
    return tiles
            .firstWhere((element) => element.state == TileState.UNTOUCHED,
                orElse: () => Tile(0, 0, 0))
            .y -
        OFFSET_PAUSE_POSITION_Y;
  }

  Tile getNextUntouchedTile() {
    for (var i = 0; i < _visibleTileCount; i++) {
      final tile = tiles[i];
      if (tile.state == TileState.UNTOUCHED) {
        return tile;
      }
    }
    return null;
  }

  void render(Canvas canvas) {
    for (var i = 0; i < _visibleTileCount; i++) {
      canvas.save();
      tiles[i].draw(canvas);
      canvas.restore();
    }
  }
}
