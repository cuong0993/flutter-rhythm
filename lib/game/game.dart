import 'dart:io';
import 'dart:math';

import "package:collection/collection.dart";
import 'package:dart_midi/dart_midi.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hitnotes/blocs/game/constants.dart';
import 'package:hitnotes/blocs/game/midi_util.dart';
import 'package:hitnotes/blocs/game/tile.dart';
import 'package:hitnotes/blocs/game/tiles_controller.dart';
import 'package:hitnotes/models/note.dart';
import 'package:hitnotes/models/song.dart';
import 'package:hitnotes/models/tile_chunk.dart';
import 'package:path_provider/path_provider.dart';

class MyGame extends Game with HasWidgetsOverlay, MultiTouchTapDetector {
  final Song song;
  var errorCount = 0;

  //val userRepository: UserRepository by inject()
  //private val midiProcessor: MidiProcessor by inject()
  //private val gameManager: GameManager by inject()

  final tilesController = TilesController();
  var state = State.PREPARE;

  double time = 0;
  double infoTime = 0;

//final tileEffects = List<Effect>();
//private val rippleEffects = hashMapOf<Int, RippleEffect>()
  double accumulator = 0;
  double step = 1.0 / 60.0;
  int numberOfTouchPointers = 5; // 5 fingers
//private val touches = Array(numberOfTouchPointers) { TouchData() }
  var initialYAllowedTouch = double.maxFinite;

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

  onTileTouched(Tile tile) {
  //tileEffects.addAll(tile.getEffects())
  }

  start(
  int bpm,
  MidiFile midiFile
  ) {
  errorCount = 0;
  time = 0;
  tilesController.initialize(midiFile, bpm, this.onTileTouched);
  // maxTimeEventFlow.value = tilesController.gameDuration;
  // songNameEventFlow.value = song.title
  // noteEventFlow.value = 0
  state = State.PLAY;
  // KtxAsync.launch {
  // gameManager.register(Game(userRepository.getUserId(), song.id))
  // }
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
  void render(Canvas canvas) {
    // TODO: implement render
  }

  @override
  void update(double t) {
    // infoTime += t;
    // if (infoTime >= 1.0) {
    //   //infoEventFlow.value = ""
    //   infoTime = 0;
    // }
    // if (state != State.STOP) {
    //   /* Max frame time to avoid spiral of death */
    //   val restrictedTime = if (delta > 0.25f) 0.25f else delta
    // accumulator += restrictedTime
    // while (accumulator >= step) {
    // initialYAllowedTouch = Float.MAX_VALUE
    // for (i in 0 until numberOfTouchPointers) {
    // val touched = Gdx.input.isTouched(i)
    // if (touches[i].touched && !touched) {
    // touches[i] = TouchData(touched = false, handled = false, x = 0, y = 0)
    // } else if (!touches[i].touched && touched) {
    // touches[i] = TouchData(
    // touched = true,
    // handled = false,
    // x = Gdx.input.getX(i),
    // y = Gdx.input.getY(i)
    // )
    // }
    // }
    // /*// FIXME In automate mode, fake touches
    //             tilesController.getNextUntouchedTile()?.let {
    //                 if (it.y < OFFSET_PAUSE_POSITION_Y + com.chaomao.hittick.utils.SIZE_DP_8) {
    //                     val x = com.chaomao.hittick.utils.SIZE_DP_48
    //                     val y = SCREEN_HEIGHT.toInt() - com.chaomao.hittick.utils.SIZE_DP_48
    //                     touches[0] = TouchData(
    //                         touched = true,
    //                         handled = false,
    //                         x = x,
    //                         y = y
    //                     )
    //                     touches[1] = TouchData(
    //                         touched = true,
    //                         handled = false,
    //                         x = x + com.chaomao.hittick.utils.SIZE_DP_48,
    //                         y = y
    //                     )
    //                     touches[2] = TouchData(
    //                         touched = true,
    //                         handled = false,
    //                         x = x + 2 * com.chaomao.hittick.utils.SIZE_DP_48,
    //                         y = y
    //                     )
    //                     touches[3] = TouchData(
    //                         touched = true,
    //                         handled = false,
    //                         x = x + 3 * com.chaomao.hittick.utils.SIZE_DP_48,
    //                         y = y
    //                     )
    //                     touches[4] = TouchData(
    //                         touched = true,
    //                         handled = false,
    //                         x = x + 4 * com.chaomao.hittick.utils.SIZE_DP_48,
    //                         y = y
    //                     )
    //                 }
    //             }*/
    // for (i in 0 until numberOfTouchPointers) {
    // if (touches[i].touched && !touches[i].handled) {
    // touches[i] = touches[i].copy(handled = true)
    // if (touches[i].y > NON_TOUCH_REGION_HEIGHT) {
    // val tile = tilesController.getNextUntouchedTile()
    // if (tile != null) {
    // if (tile.initialY <= initialYAllowedTouch) {
    // tile.touchDown()
    // if (state == State.PAUSE) {
    // state = State.PLAY
    // }
    // midiProcessor.playNote(tile.note.toByte())
    // noteEventFlow.value = noteEventFlow.value + 1
    // initialYAllowedTouch = tile.initialY
    // if (tile.y == OFFSET_PAUSE_POSITION_Y) {
    // errorCount++
    // infoTime = 0f
    // infoEventFlow.value = "txt_too_late".get()
    // } else if (tile.y > OFFSET_PAUSE_POSITION_Y + SIZE_DP_120) {
    // errorCount++
    // infoTime = 0f
    // infoEventFlow.value = "txt_too_early".get()
    // }
    // } else {
    // errorCount++
    // infoTime = 0f
    // infoEventFlow.value = "txt_too_many_fingers".get()
    // /*// FIXME In automate mode, break to avoid too many fingers error
    //                                 break*/
    // }
    // rippleEffects[i] =
    // RippleEffect(
    // touches[i].x,
    // SCREEN_HEIGHT.toInt() - touches[i].y
    // )
    // }
    // }
    // }
    // }
    // accumulator -= step
    // if (state == State.PLAY) {
    // val actualDeltaTime = tilesController.tryUpdate(step)
    // if (step > actualDeltaTime) {
    // pause()
    // }
    // if (tilesController.tiles.isEmpty()) {
    // state = State.COMPLETE
    // onComplete()
    // }
    // time += actualDeltaTime
    // timeEventChannel.offer(time)
    // }
    // }
  }
}

enum State {
PREPARE,
PLAY,
PAUSE,
STOP,
COMPLETE
}
