import 'constants.dart';

class Tile {
  final int note;
  final double initialY;
  var y = double.maxFinite;
  var state = TileState.UNTOUCHED;
  final double width = 48;
  final double height = 48;
  Function(Tile tile) onTouched;
  final double x;

  Tile(this.note, column, this.initialY) : x = X_POSITIONS[column];
}

enum TileState { UNTOUCHED, TOUCHED }
