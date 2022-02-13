import 'dart:collection';
import 'dart:ui';

import 'tile/tile_converter.dart';

final screenWidth = window.physicalSize.width / window.devicePixelRatio;
final screenHeight = window.physicalSize.height / window.devicePixelRatio;
String nearestDevicePixelRatioFolder = () {
  final candidates = SplayTreeMap<double, String>.from(<double, String>{
    1: '',
    1.5: '1.5x/',
    2.0: '2.0x/',
    3.0: '3.0x/',
    4.0: '4.0x/',
  });
  final value = window.devicePixelRatio;
  if (candidates.containsKey(value)) {
    return candidates[value]!;
  }
  final lower = candidates.lastKeyBefore(value);
  final upper = candidates.firstKeyAfter(value);
  if (lower == null) {
    return candidates[upper]!;
  }
  if (upper == null) {
    return candidates[lower]!;
  }

  return value > (lower + upper) / 2 ? candidates[upper]! : candidates[lower]!;
}();

final positionsX = () {
  final positionXs = <double>[];
  const tilePad = 24;
  const paddedTileWidth = tileWidth + tilePad * 2;
  final padLeftRight = (screenWidth - numberTileColumn * paddedTileWidth) / 2;
  for (var column = 0; column < numberTileColumn; column++) {
    positionXs.add(padLeftRight + column * paddedTileWidth + tilePad);
  }

  return positionXs;
}();
final pauseY = screenHeight - 48;
