import '../effect.dart';
import '../ripple_effect.dart';
import '../util.dart';
import 'tile.dart';
import 'tile_touch_effect.dart';

extension TileEffectSpawner on Tile {
  List<Effect> getEffects() {
    return [
      RippleEffect(positionsX[column] + width / 2, y + height / 2),
      TileTouchEffect(this)
    ];
  }
}
