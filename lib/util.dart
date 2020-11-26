import 'dart:collection';
import 'dart:ui';

import 'game/tile/tile_converter.dart';

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
final pauseY = screenHeight - 48;
