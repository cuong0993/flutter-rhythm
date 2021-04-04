import 'tile_converter.dart';

class Tile {
  final int note;
  final double initialY;
  double y = 0.0;
  TileState state = TileState.untouched;
  final double width = tileWidth;
  final double height = tileHeight;
  Function(Tile tile)? onTouched;
  final int column;

  Tile(this.note, this.column, this.initialY);
}

enum TileState { untouched, touched }
