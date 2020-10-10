import 'package:hitnotes/blocs/game/tile.dart';

extension TileUpdater on Tile {
  void updateY(
  double deltaY
  ) {
    this.y = initialY - deltaY;
  }
}