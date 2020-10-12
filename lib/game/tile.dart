import 'util.dart';

class Tile {
  final int note;
  final double initialY;
  var y = double.maxFinite;
  var state = TileState.UNTOUCHED;
  final double width = TILE_WIDTH;
  final double height = TILE_HEIGHT;
  Function(Tile tile) onTouched;
  final double x;

  Tile(this.note, column, this.initialY) : x = positionsX[column];
}

enum TileState { UNTOUCHED, TOUCHED }
