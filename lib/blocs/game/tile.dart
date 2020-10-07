class Tile {
  final int note;
  final int column;
  final double initialY;
  var y = double.maxFinite;
  var state = State.UNTOUCHED;
  final double width = 64;
  final double height = 64;
  //var onTouched: ((tile: Tile) -> Unit)? = null;
  //final x = X_POSITIONS[column];
  final x = 0;


  Tile(this.note, this.column, this.initialY);
}

enum State {
UNTOUCHED,
TOUCHED
}