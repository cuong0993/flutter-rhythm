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
    final songsMap = {};
    dir.listSync(recursive: true).whereType<File>().toList().forEach((file) {
      final key = file.uri.toString().split('/').last.replaceAll('.mid', '');
      print(
          '*************************** Checking $key ***************************');
      final artist = key.split('-').first;
      final title = key.replaceAll('$artist-', '').replaceAll('_', ' ');
      final artist1 = artist.replaceAll('_', ' ');
      final midiFile = MidiParser().parseMidiFromFile(File(file.path));
      final events = midiFile.tracks[0];
      final track = midiFile.tracks.length;
      final value = {};
      if (track != 2) {
        print('WARNING trackCount $track');
      }
      for (final midiEvent in events) {
        if (midiEvent is SetTempoEvent) {
          final tempo = 60000000 ~/ midiEvent.microsecondsPerBeat;
          print('Tempo is $tempo');
          value['bpm'] = tempo;
          break;
        }
      }
      final tileChunks = createTileChunks(midiFile);
      final groupByDurationToPrevious = Map.fromEntries(groupBy(
              tileChunks, (TileChunk tileChunk) => tileChunk.durationToPrevious)
          .entries
          .toList()
            ..sort((e1, e2) => e1.key.compareTo(e2.key)));
      final countDurationToPrevious = {
        for (var e in groupByDurationToPrevious.keys)
          e: groupByDurationToPrevious[e].length
      };

      final sortCountDurationToPrevious = Map.fromEntries(
          countDurationToPrevious.entries.toList()
            ..sort((e1, e2) => e1.value.compareTo(e2.value)));
      final unitDuration = sortCountDurationToPrevious.keys.last;

      groupByDurationToPrevious.entries.forEach((it) {
        print('There are ${it.value.length} tile with duration ${it.key}');
      });

      final tiles = createTiles(tileChunks, unitDuration, NUMBER_TILE_COLUMN);
      print('There are ${tiles.length} tiles');
      var tick2Second =
          tickToSecond(midiFile.header.ticksPerBeat, value['bpm'] as int);
      var speedDpsPerTick = UNIT_DURATION_HEIGHT / unitDuration;
      var speedDpsPerSecond = speedDpsPerTick / tick2Second;
      final singleTileSeconds = unitDuration * tick2Second;
      if (singleTileSeconds < 0.2) {
        final newBpm =
            ((value['bpm'] as int) * (singleTileSeconds / 0.2)).toInt();
        print('WARNING Too fast $singleTileSeconds $key, set bpm to $newBpm');
        value['bpm'] = newBpm;
        tick2Second =
            tickToSecond(midiFile.header.ticksPerBeat, value['bpm'] as int);
        speedDpsPerTick = UNIT_DURATION_HEIGHT / unitDuration;
        speedDpsPerSecond = speedDpsPerTick / tick2Second;
      }
      final tileCount = tiles.length;
      if (tileCount < 50) {
        print('WARNING Number tile to small $key, number tiles $tileCount');
      }
      final duration = (0.5 + ((0.0 - tiles.last.initialY) * 1000000)/ speedDpsPerSecond).toInt();
      print('Duration is $duration microseconds');
      if (duration > 400000000) {
        print('WARNING  Too long ${duration / 60000000} minutes');
      }
      value['tilesCount'] = [
        createTiles(tileChunks, unitDuration, 2).length,
        createTiles(tileChunks, unitDuration, 3).length,
        createTiles(tileChunks, unitDuration, 4).length
      ];
      value['duration'] = [
        (0.5 + ((0.0 - tiles.last.initialY) * 1000000) / (speedDpsPerSecond * 0.75)).toInt(),
        (0.5 + ((0.0 - tiles.last.initialY) * 1000000) / speedDpsPerSecond).toInt(),
        (0.5 + ((0.0 - tiles.last.initialY) * 1000000) / (speedDpsPerSecond *1.25)).toInt()
      ];
      value['artist'] = artist1;
      value['id'] = key;
      value['imageUrl'] = "images/${artist.replaceAll("_", "")}.jpg";
      value['title'] = title;
      value['url'] = file.uri.toString().replaceAll('storage/', '');
      value['__collections__'] = {};
      songsMap[key] = value;
    });
    collections['songs'] = songsMap;
    jsonData['__collections__'] = collections;
    File('database/db.json').writeAsStringSync(json.encode(jsonData));
  });
}
