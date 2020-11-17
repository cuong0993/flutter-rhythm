import '../effect.dart';
import 'tile.dart';
import 'tile_touch_effect.dart';

extension TileEffectSpawner on Tile {
  List<Effect> getEffects() {
    return [TileTouchEffect(this)];
  }
}
