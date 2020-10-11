import 'dart:ui';

final screenWidth = window.physicalSize.width / window.devicePixelRatio;
final screenHeight = window.physicalSize.height / window.devicePixelRatio;
const NUMBER_TILE_COLUMN = 4;
final offsetDrawY = screenHeight;
const UNIT_DURATION_HEIGHT = 72;
const TILE_WIDTH = 24.0;
const TILE_HEIGHT = TILE_WIDTH;
final positionsX = () {
  final positionXs = <double>[];
  const TILE_PAD = 24;
  final paddedTileWidth = TILE_WIDTH + 2 * TILE_PAD;
  final padLeftRight =
      (screenWidth - NUMBER_TILE_COLUMN * paddedTileWidth) / 2;
  for (var column = 0; column < NUMBER_TILE_COLUMN; column++) {
    positionXs.add(padLeftRight + column * paddedTileWidth + TILE_PAD);
  }
  return positionXs;
}();
const NON_TOUCH_REGION_HEIGHT = 96;
final startVisibleY = screenHeight - NON_TOUCH_REGION_HEIGHT;
const OFFSET_PAUSE_POSITION_Y = 14;
const SIZE_DP_120 = 120;
