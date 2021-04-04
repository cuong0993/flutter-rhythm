import 'tile.dart';

extension TileInputHandler on Tile {
  void touchDown() {
    state = TileState.touched;
  }
}
