import 'tile_converter.dart';

class Tile {
  Tile(this.note, this.column, this.initialY);

  final int note;
  final double initialY;
  double y = 0;
  TileState state = TileState.untouched;
  final double width = tileWidth;
  final double height = tileHeight;
  Function(Tile tile)? onTouched;
  final int column;
}

enum TileState { untouched, touched }
