import 'dart:ui';

const NUMBER_TILE_COLUMN = 4;
// ignore: non_constant_identifier_names
final OFFSET_DRAW_POSITION_Y = window.physicalSize.height.toInt().toDouble();
// ignore: non_constant_identifier_names
final UNIT_DURATION_HEIGHT = (72 * window.devicePixelRatio).toInt().toDouble();
const NUMBER_OF_NOTES = 128;
// ignore: non_constant_identifier_names
final TILE_WIDTH = (24 * window.devicePixelRatio).toInt().toDouble();
// ignore: non_constant_identifier_names
final TILE_HEIGHT = TILE_WIDTH;
// ignore: non_constant_identifier_names
final X_POSITIONS = () {
  final positionXs = List<double>();
  final paddedTileWidth = TILE_WIDTH + (48 * window.devicePixelRatio).toInt().toDouble();
  final padLeftRight = (window.physicalSize.width - NUMBER_TILE_COLUMN * paddedTileWidth) / 2;
  for (var column = 0 ; column < NUMBER_TILE_COLUMN; column++) {
    positionXs.add(padLeftRight + column * paddedTileWidth +
        (24 * window.devicePixelRatio).toInt().toDouble());
  }
  return positionXs;
}();
