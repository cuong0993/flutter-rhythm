import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import '../note/note.dart';

part 'tile_chunk.g.dart';

abstract class TileChunk implements Built<TileChunk, TileChunkBuilder> {
  factory TileChunk([Function(TileChunkBuilder) updates]) = _$TileChunk;

  TileChunk._();

  BuiltList<Note> get notes;

  int get durationToPrevious;

  int get startTick;
}
