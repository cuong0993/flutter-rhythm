import 'dart:math';

import 'package:collection/collection.dart';
import 'package:dart_midi/dart_midi.dart';

import '../note/note.dart';
import '../tile/tile.dart';
import '../tile/tile_chunk.dart';

const MINUTE_TO_SECOND = 60;
const NUMBER_OF_NOTES = 128;
const NUMBER_TILE_COLUMN = 4;
const UNIT_DURATION_HEIGHT = 72;
const TILE_WIDTH = 36.0;
const TILE_HEIGHT = TILE_WIDTH;
const NON_TOUCH_REGION_HEIGHT = 160;
const startVisibleY = 0;

double tickToSecond(int resolution, int bpm) {
  return MINUTE_TO_SECOND.toDouble() / (resolution * bpm);
}

List<TileChunk> createTileChunks(MidiFile midiFile) {
  final tileNotes = <Note>[];
  final onsets = List<int>.filled(NUMBER_OF_NOTES, -1, growable: false);
  for (final midiTrack in midiFile.tracks) {
    var totalTicks = 0;
    for (final midiEvent in midiTrack) {
      totalTicks += midiEvent.deltaTime;
      if (midiEvent is NoteOnEvent) {
        final noteValue = midiEvent.noteNumber;
        if (onsets[noteValue] == -1) {
          onsets[noteValue] = totalTicks;
        }
      } else if (midiEvent is NoteOffEvent) {
        final noteValue = midiEvent.noteNumber;
        if (onsets[noteValue] >= 0) {
          tileNotes.add(Note(note: noteValue, startTick: onsets[noteValue]));
          onsets[noteValue] = -1;
        }
      }
    }
  }
  final tileChunks = <TileChunk>[];

  var previousStartTick = 0;
  Map.fromEntries(
          groupBy(tileNotes, (Note note) => note.startTick).entries.toList()
            ..sort((e1, e2) => e1.key.compareTo(e2.key)))
      .forEach((key, value) {
    tileChunks.add(TileChunk(
        notes: value,
        durationToPrevious: value[0].startTick - previousStartTick,
        startTick: value[0].startTick));
    previousStartTick = value[0].startTick;
  });
  return tileChunks;
}

List<Tile> createTiles(
  List<TileChunk> tileChunks,
  int unitDuration,
  int numberTileColumn,
) {
  final tiles = <Tile>[];
  final random = Random();
  var calibratedTick = 0;
  for (final chunk in tileChunks) {
    var tileColumn = (numberTileColumn <= chunk.notes.length)
        ? 0
        : random.nextInt(numberTileColumn - chunk.notes.length);
    if (chunk.durationToPrevious < unitDuration) {
      /* Calibrate to make sure a note will away from previous note at least unitTileDuration */
      calibratedTick += unitDuration - chunk.durationToPrevious;
    }
    final initialPositionY =
        -((UNIT_DURATION_HEIGHT / unitDuration) * chunk.startTick +
            calibratedTick);
    chunk.notes.asMap().forEach((index, note) {
      if (index < numberTileColumn) {
        final tile = Tile(note.note, tileColumn, initialPositionY);
        tiles.add(tile);
        tileColumn++;
      }
    });
  }
  return tiles;
}
