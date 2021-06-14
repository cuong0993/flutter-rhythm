import 'package:freezed_annotation/freezed_annotation.dart';

import '../note/note.dart';

part 'tile_chunk.freezed.dart';

@freezed
class TileChunk with _$TileChunk {
  factory TileChunk({
    required List<Note> notes,
    required int durationToPrevious,
    required int startTick,
  }) = _TileChunk;
}
