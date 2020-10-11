import 'dart:ui';

import 'package:hitnotes/blocs/game/constants.dart';
import 'package:hitnotes/blocs/game/tile.dart';
import 'package:hitnotes/blocs/game/tile_drawer.dart';
import 'package:hitnotes/blocs/game/tile_updater.dart';

class TilesController {
  var _visibleTileCount = 0;
  double _deltaY = 0;
  double _speedPixelsPerSecond = 0;
  var tiles = List<Tile>();
  Function(Tile tile) _onTileTouched;

  initialize(List<Tile> tiles, double speedPixelsPerSecond,
      Function(Tile tile) onTouched) {
    this._speedPixelsPerSecond = speedPixelsPerSecond;
    _visibleTileCount = 0;
    _deltaY = 0;
    this._onTileTouched = onTouched;
    this.tiles = tiles;
  }

  double tryUpdate(double delta) {
    _tryToMakeTilesVisible();
    final maxDeltaTime = _getMaxDeltaY() / _speedPixelsPerSecond;
    final actualDelta = (delta >= maxDeltaTime) ? maxDeltaTime : delta;

    this._deltaY += _speedPixelsPerSecond * actualDelta;
    for (int i = 0; i < _visibleTileCount; i++) {
      tiles[i].updateY(_deltaY);
    }
    return actualDelta;
  }

  _tryToMakeTilesVisible() {
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
    for (int i = _visibleTileCount; i < tiles.length; i++) {
      final tile = tiles[i];
      if (tile.initialY - _deltaY <= START_VISIBLE_POSITION_Y) {
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
    for (int i = 0; i < _visibleTileCount; i++) {
      final tile = tiles[i];
      if (tile.state == TileState.UNTOUCHED) {
        return tile;
      }
    }
    return null;
  }

  render(Canvas canvas) {
    for (int i = 0; i < _visibleTileCount; i++) {
      canvas.save();
      tiles[i].draw(canvas);
      canvas.restore();
    }
  }
}
