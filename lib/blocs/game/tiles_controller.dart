import 'dart:math';

import 'package:dart_midi/dart_midi.dart';
import 'package:flutter/cupertino.dart';
import 'package:hitnotes/blocs/game/midi_util.dart';
import 'package:hitnotes/blocs/game/tile.dart';
import 'package:hitnotes/blocs/game/constants.dart';
import 'package:hitnotes/blocs/game/tile_updater.dart';
import 'package:hitnotes/blocs/game/tile_drawer.dart';
import 'package:hitnotes/blocs/game/midi_util.dart';
import 'package:hitnotes/models/note.dart';

import "package:collection/collection.dart";
import 'package:hitnotes/models/tile_chunk.dart';

class TilesController {
  var visibleTileCount = 0;
  double deltaY = 0;
  double gameDuration = 0;
  double speedPixelsPerSecond = 0;
  var tiles = List<Tile>();
  Function(Tile tile) onTileTouched;

  initialize(MidiFile midiFile, int bpm,
      Function(Tile tile) onTouched) {
    final tileChunks =
    createTileChunks(midiFile);
    final groupByDurationToPrevious = Map.fromEntries(groupBy(
        tileChunks, (TileChunk tileChunk) => tileChunk.durationToPrevious)
        .entries
        .toList()
      ..sort((e1, e2) => e1.key.compareTo(e2.key)));
    final countDurationToPrevious = new Map.fromIterable(
        groupByDurationToPrevious.keys,
        key: (k) => k,
        value: (v) => groupByDurationToPrevious[v].length);

    final sortCountDurationToPrevious = Map.fromEntries(
        countDurationToPrevious.entries.toList()
          ..sort((e1, e2) => e1.value.compareTo(e2.value)));
    final unitDuration = sortCountDurationToPrevious.values.last;
    final tiles = createTiles(tileChunks, unitDuration);
    final tickToSecond = tickToSecond1(midiFile.header.timeDivision, bpm);
    final speedPixelsPerTick = UNIT_DURATION_HEIGHT / unitDuration;
    speedPixelsPerSecond = speedPixelsPerTick / tickToSecond;
    gameDuration = tiles.last.initialY / speedPixelsPerSecond;
    visibleTileCount = 0;
    deltaY = 0;
    this.onTileTouched = onTouched;
  }

  double tryUpdate(double delta) {
    tryToMakeTilesVisible();
    final maxDeltaTime = getMaxDeltaY() / speedPixelsPerSecond;
    final actualDelta = (delta >= maxDeltaTime) ? maxDeltaTime : delta;

    this.deltaY += speedPixelsPerSecond * actualDelta;
    for (int i = 0; i < visibleTileCount; i++) {
      tiles[i].updateY(deltaY);
    }
    return actualDelta;
  }

  tryToMakeTilesVisible() {
    var end = 0;
    final iterator = tiles.iterator;
    while (iterator.moveNext()) {
      final tile = iterator.current;
      if (tile.state == TileState.TOUCHED) {
        visibleTileCount--;
        end++;
      } else {
        break;
      }
    }
    tiles.removeRange(0, end);
    for (int i = 0; i < visibleTileCount && i < tiles.length; i++) {
      final tile = tiles[i];
      if (tile.initialY - deltaY <= START_VISIBLE_POSITION_Y) {
        tile.y = tile.initialY - deltaY;
        tile.onTouched = onTileTouched;
        visibleTileCount += 1;
      } else {
        break;
      }
    }
  }

  double getMaxDeltaY() {
    return tiles.firstWhere((element) => element.state == TileState.UNTOUCHED, orElse: () => Tile(0, 0, 0)).y - OFFSET_PAUSE_POSITION_Y;
  }

  Tile getNextUntouchedTile() {
    for (int i =0; i < visibleTileCount;i++) {
      final tile = tiles[i];
      if (tile.state == TileState.UNTOUCHED) {
        return tile;
      }
    }
    return null;
  }

  draw(Canvas canvas) {
  for (int i =0; i < visibleTileCount;i++) {
  tiles[i].draw(canvas);
  }
  }

  List<TileChunk> createTileChunks(MidiFile midiFile) {
    final tileNotes = List<Note>();
    List<int> onsets =
    new List<int>.filled(NUMBER_OF_NOTES, -1, growable: false);
    for (List<MidiEvent> midiTrack in midiFile.tracks) {
      int totalTicks = 0;
      for (MidiEvent midiEvent in midiTrack) {
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
    final tileChunks = List<TileChunk>();

    var previousStartTick = -10000;
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

  List<Tile> createTiles(List<TileChunk> tileChunks, int unitDuration) {
    final tiles = List<Tile>();
    final random = Random();
    var calibratedTick = 0;
    for (TileChunk chunk in tileChunks) {
      var tileColumn = (NUMBER_TILE_COLUMN <= chunk.notes.length)
          ? 0
          : random.nextInt(NUMBER_TILE_COLUMN - chunk.notes.length);
      if (chunk.durationToPrevious < unitDuration) {
        /* Calibrate to make sure a note will away from previous note at least unitTileDuration */
        calibratedTick += unitDuration - chunk.durationToPrevious;
      }
      final initialPositionY =
          ((UNIT_DURATION_HEIGHT / unitDuration) * chunk.startTick +
              calibratedTick) +
              OFFSET_DRAW_POSITION_Y;
      chunk.notes.asMap().forEach((index, note) {
        if (index < NUMBER_TILE_COLUMN) {
          final tile = Tile(note.note, tileColumn, initialPositionY);
          tiles.add(tile);
          tileColumn++;
        }
        /* else {
          break;
        }*/
      });
    }
    return tiles;
  }
}
