import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dart_midi/dart_midi.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hitnotes/game/note.dart';
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
      final StorageFileDownloadTask task = FirebaseStorage.instance.ref().child(event.song.url).writeToFile(tempFile);
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
    }
    if (event is GameUpdated) {
      yield GameLoaded(event.songs);
    }
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

  List<TileChunk> createTileChunks (MidiFile midiFile) {
    const NUMBER_OF_NOTES = 128;
    List<Note> tileNotes = List<Note>();
    List<bool> onsets = List<bool>(NUMBER_OF_NOTES);
    for (List<MidiEvent> midiTrack in midiFile.tracks) {
      for (MidiEvent midiEvent in midiTrack) {
        if (midiEvent is NoteOnEvent) {
          //final noteOn = midiEvent as NoteOnEvent;
          final noteValue = midiEvent.noteNumber;
          final noteOnTick = midiEvent.deltaTime
          if (noteOn.velocity != 0 && onsets[noteValue] == -1L) {
            onsets[noteValue] = noteOnTick

          } else if (onsets[noteValue] >= 0) {
            tileNotes.add(Note(noteValue, onsets[noteValue]))
            onsets[noteValue] = -1
          }
        }
      }
    }
  }
}
