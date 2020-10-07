import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import "package:collection/collection.dart";
import 'package:dart_midi/dart_midi.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hitnotes/blocs/game/tile.dart';
import 'package:hitnotes/models/note.dart';
import 'package:hitnotes/models/tile_chunk.dart';
import 'package:hitnotes/repositories/songs_repository.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final SongRepository _songsRepository;
  StreamSubscription _songsSubscription;

  GameBloc({@required SongRepository songsRepository})
      : assert(songsRepository != null),
        _songsRepository = songsRepository,
        super(GameLoading());

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {
    if (event is StartGame) {
      //yield* _mapStartGameToState();
      final directory = await getApplicationSupportDirectory();
      //final String url = await FirebaseStorage.instance.ref().child(event.song.url).getDownloadURL();
      //final Directory systemTempDir = Directory.systemTemp;
      final File tempFile = File('${directory.path}/${event.song.url}');
      if (tempFile.existsSync()) {
        await tempFile.delete();
      }
      await tempFile.create(recursive: true);
      // assert(await tempFile.readAsString() == "");
      final StorageFileDownloadTask task = FirebaseStorage.instance
          .ref()
          .child(event.song.url)
          .writeToFile(tempFile);
      await task.future;
      //var file = File('sample_midi.mid');

// Construct a midi parser
      var parser = MidiParser();

// Parse midi directly from file. You can also use parseMidiFromBuffer to directly parse List<int>
      MidiFile parsedMidi = parser.parseMidiFromFile(tempFile);

// You can now access your parsed [MidiFile]
      print(parsedMidi.tracks.length.toString());
      //final int byteCount = (await task.future).totalByteCount;
      //final String tempFileContents = await tempFile.readAsString();
      final tileChunks = createTileChunks(parsedMidi);
      // final unitDuration = tileChunks.groupingBy {
      //   it.durationToPrevious
      // }.eachCount().toList()
      //   .sortedByDescending { (_, count) -> count }[0].first;

    final m = Map.fromEntries(
    groupBy(tileChunks, (TileChunk tileChunk) => tileChunk.durationToPrevious).entries.toList()
    ..sort((e1, e2) => e1.key.compareTo(e2.key)));
      //final b = new Map.fromEntries(a.entries.toList());
    //final b = countBy(a, (v) => v.length);
      //Map m = {'1': 1, '2':2 };
      var newMap = new Map.fromIterable(m.keys, key: (k) => k , value: (v) => m[v].length );

      final unitDuration1 = Map.fromEntries(newMap.entries.toList()..sort((e1, e2) => e1.value.compareTo(e2.value)));
      final unitDuration = unitDuration1.values.last;
    final tiles = createTiles(
    tileChunks,
    unitDuration
    );
    int i = 0;
    }
    if (event is GameUpdated) {
    yield GameLoaded(event.songs);
    }
  }

  Map<Y, int> countBy<T, Y>(Iterable<T> itr, Y Function(T) fn) {
    return Map.fromIterable(itr.map(fn).toSet(),
        value: (i) => itr.where((v) => fn(v) == i).length);
  }

  // Stream<GameState> _mapStartGameToState() async* {
  //   //   final directory = await getApplicationSupportDirectory();
  //   //   FirebaseStorage.instance.ref().child(path)
  //   // }

  @override
  Future<void> close() {
    _songsSubscription?.cancel();
    return super.close();
  }

  List<TileChunk> createTileChunks(MidiFile midiFile) {
    const NUMBER_OF_NOTES = 128;
    final tileNotes = List<Note>();
    List<int> onsets =
    new List<int>.filled(NUMBER_OF_NOTES, -1, growable: false);
    for (List<MidiEvent> midiTrack in midiFile.tracks) {
      int totalTicks = 0;
      for (MidiEvent midiEvent in midiTrack) {
        totalTicks += midiEvent.deltaTime;
        if (midiEvent is NoteOnEvent) {
          final noteValue = midiEvent.noteNumber;
          if (midiEvent.velocity != 0 && onsets[noteValue] == -1) {
            onsets[noteValue] = totalTicks;
          } else if (onsets[noteValue] >= 0) {
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
    const NUMBER_TILE_COLUMN = 4;
    const OFFSET_DRAW_POSITION_Y = 0;
    const UNIT_DURATION_HEIGHT = 72;

    final tiles = List<Tile>();
    final random = Random();
    var calibratedTick = 0;
    for (TileChunk chunk in tileChunks) {
      var tileColumn = (NUMBER_TILE_COLUMN <= chunk.notes.length) ? 0 : random
          .nextInt(NUMBER_TILE_COLUMN - chunk.notes.length);
      if (chunk.durationToPrevious < unitDuration) {
        /* Calibrate to make sure a note will away from previous note at least unitTileDuration */
        calibratedTick += unitDuration - chunk.durationToPrevious;
      }
      final initialPositionY =
          ((UNIT_DURATION_HEIGHT / unitDuration) * chunk.startTick +
              calibratedTick) + OFFSET_DRAW_POSITION_Y;
      chunk.notes.asMap().forEach((index, note) {
        if (index < NUMBER_TILE_COLUMN) {
          final tile = Tile(
              note.note,
              tileColumn,
              initialPositionY
          );
          tiles.add(tile);
          tileColumn++;
        } /* else {
          break;
        }*/
      });
    }
    return tiles;
  }
}
