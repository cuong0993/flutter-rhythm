import 'dart:math';

import 'package:collection/collection.dart';
import 'package:dart_midi/dart_midi.dart';

import '../note/note.dart';
import '../tile/tile.dart';
import '../tile/tile_chunk.dart';

const minuteToSecond = 60;
const numberOfNotes = 128;
const numberTileColumn = 4;
const unitDurationHeight = 72;
const tileWidth = 36.0;
const tileHeight = tileWidth;
const nonTouchRegionHeight = 160;
const startVisibleY = 0;

double tickToSecond(int resolution, int bpm) {
  return minuteToSecond.toDouble() / (resolution * bpm);
}

List<TileChunk> createTileChunks(MidiFile midiFile) {
  final tileNotes = <Note>[];
  final onsets = List<int>.filled(numberOfNotes, -1, growable: false);
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
          tileNotes.add(Note(noteValue, onsets[noteValue]));
          onsets[noteValue] = -1;
        }
      }
    }
  }
  final tileChunks = <TileChunk>[];

  var previousStartTick = 0;
  Map<int, List<Note>>.fromEntries(
          groupBy<Note, int>(tileNotes, (note) => note.startTick)
              .entries
              .toList()
                ..sort((e1, e2) => e1.key.compareTo(e2.key)))
      .forEach((key, value) {
    tileChunks.add(TileChunk(
        value, value[0].startTick - previousStartTick, value[0].startTick));
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
        -((unitDurationHeight / unitDuration) * chunk.startTick +
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
