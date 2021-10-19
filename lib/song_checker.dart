import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dart_midi/dart_midi.dart';
import 'package:logging/logging.dart';

import 'game/tile/tile_chunk.dart';
import 'game/tile/tile_converter.dart';

void main() {
  File('database/db.json')
      .readAsString()
      .then((fileContents) => json.decode(fileContents) as Map)
      .then((jsonData) {
    final dir = Directory('storage/songs');
    final collections = jsonData['__collections__'] as Map;
    final songs = <String, Map>{};
    dir.listSync(recursive: true).whereType<File>().toList().forEach((file) {
      final id = file.uri.toString().split('/').last.replaceAll('.mid', '');
      final temp = file.uri.toString().split('/');
      final genre = temp[temp.length - 2];
      Logger.root.info(
        '*************************** Checking $id ***************************',
      );
      final artist = id.split('-').first;
      final title = id.replaceAll('$artist-', '').replaceAll('_', ' ');
      final artist1 = artist.replaceAll('_', ' ');
      final midiFile = MidiParser().parseMidiFromFile(File(file.path));
      final events = midiFile.tracks[0];
      final track = midiFile.tracks.length;
      final song = <String, dynamic>{};
      if (track != 2) {
        Logger.root.info('WARNING trackCount $track');
      }
      song['bpm'] = 0;
      for (final midiEvent in events) {
        if (midiEvent is SetTempoEvent) {
          final tempo = 60000000 ~/ midiEvent.microsecondsPerBeat;
          Logger.root.info('Tempo changes to $tempo');
          if (song['bpm'] as int <= tempo) {
            song['bpm'] = tempo;
          }
        }
      }
      Logger.root.info('Select largest tempo ${song['bpm']}');
      final tileChunks = createTileChunks(midiFile);
      final groupByDurationToPrevious = Map<int, List<TileChunk>>.fromEntries(
        groupBy<TileChunk, int>(
          tileChunks,
          (tileChunk) => tileChunk.durationToPrevious,
        ).entries.toList()
          ..sort((e1, e2) => e1.key.compareTo(e2.key)),
      );
      final countDurationToPrevious = {
        for (var e in groupByDurationToPrevious.keys)
          e: groupByDurationToPrevious[e]!.length
      };

      final sortCountDurationToPrevious = Map.fromEntries(
        countDurationToPrevious.entries.toList()
          ..sort((e1, e2) => e1.value.compareTo(e2.value)),
      );
      final mostCountDurationToPrevious = sortCountDurationToPrevious.keys.last;

      for (final it in groupByDurationToPrevious.entries) {
        Logger.root
            .info('There are ${it.value.length} tile with duration ${it.key}');
      }

      var singleTileSeconds = 0.0;
      var unitDuration = 0;
      final durations = groupByDurationToPrevious.keys.iterator;
      var tick2Second =
          tickToSecond(midiFile.header.ticksPerBeat!, song['bpm'] as int);
      const minimumSingleTileSeconds =
          0.25; // 4 touches per second, slow enough to click continuously
      while (singleTileSeconds < minimumSingleTileSeconds &&
          durations.moveNext() &&
          unitDuration < mostCountDurationToPrevious) {
        unitDuration = durations.current;
        singleTileSeconds = unitDuration * tick2Second;
        Logger.root.info('Change unitDuration $unitDuration');
        Logger.root.info('Change singleTileSeconds $singleTileSeconds');
      }

      if (singleTileSeconds < minimumSingleTileSeconds) {
        Logger.root.info('WARNING $id, Still too fast $singleTileSeconds');
        final newBpm = ((song['bpm'] as int) *
                (singleTileSeconds / minimumSingleTileSeconds))
            .toInt();
        Logger.root.info('Reduce bpm to $newBpm');
        song['bpm'] = newBpm;
        tick2Second =
            tickToSecond(midiFile.header.ticksPerBeat!, song['bpm'] as int);
      }
      final speedDpsPerTick = unitDurationHeight / unitDuration;
      final speedDpsPerSecond = speedDpsPerTick / tick2Second;
      final tiles = createTiles(tileChunks, unitDuration, numberTileColumn);
      Logger.root.info('There are ${tiles.length} tiles');
      final tileCount = tiles.length;
      if (tileCount < 50) {
        Logger.root
            .info('WARNING Number tile to small $id, number tiles $tileCount');
      }
      final duration =
          (0.5 + ((0.0 - tiles.last.initialY) * 1000000) / speedDpsPerSecond)
                  .toInt() /
              60000000;
      Logger.root.info('Duration is $duration minutes');
      if (duration > 10) {
        Logger.root.info('WARNING Too long $id, $duration minutes');
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
      song['__collections__'] = <String, dynamic>{};
      songs[id] = song;
    });
    collections['songs'] = songs;
    jsonData['__collections__'] = collections;
    File('database/db.json').writeAsStringSync(json.encode(jsonData));
  });
}
