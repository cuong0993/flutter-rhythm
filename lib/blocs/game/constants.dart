import 'dart:ui';

const NUMBER_TILE_COLUMN = 4;
// ignore: non_constant_identifier_names
final OFFSET_DRAW_POSITION_Y = window.physicalSize.height.toInt().toDouble();
// ignore: non_constant_identifier_names
final UNIT_DURATION_HEIGHT = (72 * window.devicePixelRatio).toInt().toDouble();
// ignore: non_constant_identifier_names
final TILE_WIDTH = (24 * window.devicePixelRatio).toInt().toDouble();
// ignore: non_constant_identifier_names
final TILE_HEIGHT = TILE_WIDTH;
// ignore: non_constant_identifier_names
final X_POSITIONS = () {
  final positionXs = List<double>();
  final paddedTileWidth =
      TILE_WIDTH;
  final padLeftRight =
      (window.physicalSize.width/window.devicePixelRatio - NUMBER_TILE_COLUMN * paddedTileWidth) / 2;
  for (var column = 0; column < NUMBER_TILE_COLUMN; column++) {
    positionXs.add(padLeftRight +
        column * paddedTileWidth);
  }
  return positionXs;
}();
// ignore: non_constant_identifier_names
final NON_TOUCH_REGION_HEIGHT =
    (96 * window.devicePixelRatio).toInt().toDouble();
// ignore: non_constant_identifier_names
final START_VISIBLE_POSITION_Y =
    window.physicalSize.height - NON_TOUCH_REGION_HEIGHT;
// ignore: non_constant_identifier_names
final OFFSET_PAUSE_POSITION_Y =
    (14 * window.devicePixelRatio).toInt().toDouble();
// ignore: non_constant_identifier_names
final SIZE_DP_120 = (120 * window.devicePixelRatio).toInt().toDouble();
