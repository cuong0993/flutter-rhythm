import 'dart:io';
import 'dart:math';

import "package:collection/collection.dart";
import 'package:dart_midi/dart_midi.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flame/game.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hitnotes/blocs/game/constants.dart';
import 'package:hitnotes/blocs/game/midi_util.dart';
import 'package:hitnotes/blocs/game/tile.dart';
import 'package:hitnotes/models/note.dart';
import 'package:hitnotes/models/song.dart';
import 'package:hitnotes/models/tile_chunk.dart';
import 'package:path_provider/path_provider.dart';

class MyGame extends BaseGame with HasWidgetsOverlay, MultiTouchTapDetector {
  final Song song;

  MyGame({this.song}) {
    addWidgetOverlay(
      'PauseMenu',
      Container(
        width: 500,
        height: 100,
        child: AppBar(
          title: Text(song.title),
        ),
      ),
    );
    name();
    int i = 0;
  }

  Future name() async {
    final directory = await getApplicationSupportDirectory();
    final File tempFile = File('${directory.path}/${song.url}');
    if (tempFile.existsSync()) {
      await tempFile.delete();
    }
    await tempFile.create(recursive: true);
    final StorageFileDownloadTask task =
        FirebaseStorage.instance.ref().child(song.url).writeToFile(tempFile);
    await task.future;
    MidiFile parsedMidi = MidiParser().parseMidiFromFile(tempFile);
    final tileChunks = createTileChunks(parsedMidi);
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

  void pause() {}

  @override
  void onTapDown(int pointerId, TapDownDetails details) {
    print("Tap down" + pointerId.toString());
    //print(details.toString());
  }

  @override
  void onTapUp(int pointerId, _) {
    print("Tap up" + pointerId.toString());
    // addWidgetOverlay(
    //     'PauseMenu',
    //     Center(
    //       child: Container(
    //         width: 100,
    //         height: 100,
    //         color: const Color(0xFFFF0000),
    //         child: const Center(child: const Text('Paused')),
    //       ),
    //     ));
  }

  @override
  void update(double t) {
    super.update(t);
    //print(t.toString());
  }

  @override
  bool recordFps() => true;
}
