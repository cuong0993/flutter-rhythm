import 'package:freezed_annotation/freezed_annotation.dart';

import '../note/note.dart';

part 'tile_chunk.freezed.dart';

@freezed
class TileChunk with _$TileChunk {
  factory TileChunk(
    List<Note> notes,
    int durationToPrevious,
    int startTick,
  ) = _TileChunk;
}
