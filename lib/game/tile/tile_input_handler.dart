import 'tile.dart';

extension TileInputHandler on Tile {
  bool touchDown() {
    if (state == TileState.UNTOUCHED) {
      state = TileState.TOUCHED;
      onTouched(this);
      return true;
    }
    return false;
  }
}
