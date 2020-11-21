import 'dart:collection';
import 'dart:ui';

final screenWidth = window.physicalSize.width / window.devicePixelRatio;
final screenHeight = window.physicalSize.height / window.devicePixelRatio;
String nearestDevicePixelRatioFolder = () {
  final candidates = SplayTreeMap.from(
      {1: '', 1.5: '1.5x/', 2.0: '2.0x/', 3.0: '3.0x/', 4.0: '4.0x/'});
  final value = window.devicePixelRatio;
  if (candidates.containsKey(value)) {
    return candidates[value];
  }
  final lower = candidates.lastKeyBefore(value);
  final upper = candidates.firstKeyAfter(value);
  if (lower == null) {
    return candidates[upper];
  }
  if (upper == null) {
    return candidates[lower];
  }
  if (value > (lower + upper) / 2) {
    return candidates[upper];
  } else {
    return candidates[lower];
  }
}();
extension DpToPixelConverter on int {
  int toPixel() {
    return (this * window.devicePixelRatio).toInt();
  }
}

const NUMBER_TILE_COLUMN = 4;
final offsetDrawY = screenHeight;
const UNIT_DURATION_HEIGHT = 72;
const TILE_WIDTH = 24.0;
const TILE_HEIGHT = TILE_WIDTH;
final positionsX = () {
  final positionXs = <double>[];
  const TILE_PAD = 24;
  final paddedTileWidth = TILE_WIDTH + 2 * TILE_PAD;
  final padLeftRight = (screenWidth - NUMBER_TILE_COLUMN * paddedTileWidth) / 2;
  for (var column = 0; column < NUMBER_TILE_COLUMN; column++) {
    positionXs.add(padLeftRight + column * paddedTileWidth + TILE_PAD);
  }
  return positionXs;
}();
const NON_TOUCH_REGION_HEIGHT = 120;
const startVisibleY = NON_TOUCH_REGION_HEIGHT;
final pauseY = screenHeight - 48;
const SIZE_DP_120 = 120;
const NUMBER_OF_NOTES = 128;
const MINUTE_TO_SECOND = 60;

double tickToSecond(int resolution, int bpm) {
  return MINUTE_TO_SECOND.toDouble() / (resolution * bpm);
}
