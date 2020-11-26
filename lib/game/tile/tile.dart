import 'tile_converter.dart';

class Tile {
  final int note;
  final double initialY;
  double y = 0.0;
  TileState state = TileState.UNTOUCHED;
  final double width = TILE_WIDTH;
  final double height = TILE_HEIGHT;
  Function(Tile tile) onTouched;
  final int column;

  Tile(this.note, this.column, this.initialY);
}

enum TileState { UNTOUCHED, TOUCHED }
