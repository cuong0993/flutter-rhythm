import 'dart:ui';

// ignore: non_constant_identifier_names
final SCREEN_WIDTH = window.physicalSize.width / window.devicePixelRatio;
// ignore: non_constant_identifier_names
final SCREEN_HEIGHT = window.physicalSize.height / window.devicePixelRatio;
const NUMBER_TILE_COLUMN = 4;
// ignore: non_constant_identifier_names
final OFFSET_DRAW_POSITION_Y = SCREEN_HEIGHT;
const UNIT_DURATION_HEIGHT = 72;
const TILE_WIDTH = 24.0;
// ignore: non_constant_identifier_names
final TILE_HEIGHT = TILE_WIDTH;
// ignore: non_constant_identifier_names
final X_POSITIONS = () {
  final positionXs = List<double>();
  const TILE_PAD = 24;
  final paddedTileWidth = TILE_WIDTH + 2 * TILE_PAD;
  final padLeftRight =
      (SCREEN_WIDTH - NUMBER_TILE_COLUMN * paddedTileWidth) / 2;
  for (var column = 0; column < NUMBER_TILE_COLUMN; column++) {
    positionXs.add(padLeftRight + column * paddedTileWidth + TILE_PAD);
  }
  return positionXs;
}();
// ignore: non_constant_identifier_names
const NON_TOUCH_REGION_HEIGHT = 96;
// ignore: non_constant_identifier_names
final START_VISIBLE_POSITION_Y = SCREEN_HEIGHT - NON_TOUCH_REGION_HEIGHT;
// ignore: non_constant_identifier_names
const OFFSET_PAUSE_POSITION_Y = 14;
// ignore: non_constant_identifier_names
const SIZE_DP_120 = 120;
