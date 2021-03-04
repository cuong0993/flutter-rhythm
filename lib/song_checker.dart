import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dart_midi/dart_midi.dart';

import 'game/tile/tile_chunk.dart';
import 'game/tile/tile_converter.dart';

void main() {
  File('database/db.json')
      .readAsString()
      .then((fileContents) => json.decode(fileContents))
      .then((jsonData) {
    final dir = Directory('storage/songs');
    final collections = jsonData['__collections__'];
    final songs = {};
    dir.listSync(recursive: true).whereType<File>().toList().forEach((file) {
      final id = file.uri.toString().split('/').last.replaceAll('.mid', '');
      final temp = file.uri.toString().split('/');
      final genre = temp[temp.length - 2];
      print(
          '*************************** Checking $id ***************************');
      final artist = id.split('-').first;
      final title = id.replaceAll('$artist-', '').replaceAll('_', ' ');
      final artist1 = artist.replaceAll('_', ' ');
      final midiFile = MidiParser().parseMidiFromFile(File(file.path));
      final events = midiFile.tracks[0];
      final track = midiFile.tracks.length;
      final song = {};
      if (track != 2) {
        print('WARNING trackCount $track');
      }
      song['bpm'] = 0;
      for (final midiEvent in events) {
        if (midiEvent is SetTempoEvent) {
          final tempo = 60000000 ~/ midiEvent.microsecondsPerBeat;
          print('Tempo changes to $tempo');
          if (song['bpm'] <= tempo) {
            song['bpm'] = tempo;
          }
        }
      }
      print('Select largest tempo ${song['bpm']}');
      final tileChunks = createTileChunks(midiFile);
      final groupByDurationToPrevious = Map.fromEntries(groupBy(
              tileChunks, (TileChunk tileChunk) => tileChunk.durationToPrevious)
          .entries
          .toList()
            ..sort((e1, e2) => e1.key.compareTo(e2.key)));
      final countDurationToPrevious = {
        for (var e in groupByDurationToPrevious.keys)
          e: groupByDurationToPrevious[e]!.length
      };

      final sortCountDurationToPrevious = Map.fromEntries(
          countDurationToPrevious.entries.toList()
            ..sort((e1, e2) => e1.value.compareTo(e2.value)));
      final mostCountDurationToPrevious = sortCountDurationToPrevious.keys.last;

      groupByDurationToPrevious.entries.forEach((it) {
        print('There are ${it.value.length} tile with duration ${it.key}');
      });

      var singleTileSeconds = 0.0;
      var unitDuration = 0;
      final durations = groupByDurationToPrevious.keys.iterator;
      var tick2Second =
          tickToSecond(midiFile.header.ticksPerBeat, song['bpm'] as int);
      final minimumSingleTileSeconds =
          0.25; // 4 touches per second, slow enough to click continuously
      while (singleTileSeconds < minimumSingleTileSeconds &&
          durations.moveNext() &&
          unitDuration < mostCountDurationToPrevious) {
        unitDuration = durations.current;
        singleTileSeconds = unitDuration * tick2Second;
        print('Change unitDuration $unitDuration');
        print('Change singleTileSeconds $singleTileSeconds');
      }

      if (singleTileSeconds < minimumSingleTileSeconds) {
        print('WARNING $id, Still too fast $singleTileSeconds');
        final newBpm = ((song['bpm'] as int) *
                (singleTileSeconds / minimumSingleTileSeconds))
            .toInt();
        print('Reduce bpm to $newBpm');
        song['bpm'] = newBpm;
        tick2Second =
            tickToSecond(midiFile.header.ticksPerBeat, song['bpm'] as int);
      }
      final speedDpsPerTick = UNIT_DURATION_HEIGHT / unitDuration;
      final speedDpsPerSecond = speedDpsPerTick / tick2Second;
      final tiles = createTiles(tileChunks, unitDuration, NUMBER_TILE_COLUMN);
      print('There are ${tiles.length} tiles');
      final tileCount = tiles.length;
      if (tileCount < 50) {
        print('WARNING Number tile to small $id, number tiles $tileCount');
      }
      final duration =
          (0.5 + ((0.0 - tiles.last.initialY) * 1000000) / speedDpsPerSecond)
                  .toInt() /
              60000000;
      print('Duration is $duration minutes');
      if (duration > 10) {
        print('WARNING Too long $id, $duration minutes');
      }
      song['unitDuration'] = unitDuration;
      song['tilesCount'] = [
        createTiles(tileChunks, unitDuration, 2).length,
        createTiles(tileChunks, unitDuration, 3).length,
        createTiles(tileChunks, unitDuration, 4).length
      ];
      song['duration'] = [
        (0.5 +
                ((0.0 - tiles.last.initialY) * 1000000) /
                    (speedDpsPerSecond * 0.75))
            .toInt(),
        (0.5 + ((0.0 - tiles.last.initialY) * 1000000) / speedDpsPerSecond)
            .toInt(),
        (0.5 +
                ((0.0 - tiles.last.initialY) * 1000000) /
                    (speedDpsPerSecond * 1.25))
            .toInt()
      ];
      song['id'] = id;
      song['artist'] = artist1;
      song['tags'] = [genre];
      song['title'] = title;
      song['url'] = file.uri.toString().replaceAll('storage/', '');
      song['__collections__'] = {};
      songs[id] = song;
    });
    collections['songs'] = songs;
    jsonData['__collections__'] = collections;
    File('database/db.json').writeAsStringSync(json.encode(jsonData));
  });
}
