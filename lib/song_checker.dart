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

      final groupedMidiChunks = groupBy(
          tileChunks, (TileChunk tileChunk) => tileChunk.durationToPrevious);
      final sortedMidiChunks = tileChunks
        ..sort(
            (e1, e2) => e1.durationToPrevious.compareTo(e2.durationToPrevious));
      groupedMidiChunks.entries.forEach((it) {
        print('There are ${it.value.length} tile with duration ${it.key}');
      });
      final countDurationToPrevious = {
        for (var e in groupedMidiChunks.keys) e: groupedMidiChunks[e].length
      };

      final sortCountDurationToPrevious = Map.fromEntries(
          countDurationToPrevious.entries.toList()
            ..sort((e1, e2) => e1.value.compareTo(e2.value)));
      print(
          'Most of track have duration ${sortCountDurationToPrevious.keys.last}');
      print(
          'Minimum duration as tick ${sortedMidiChunks[1].durationToPrevious}');
      print(
          'Maximum duration as tick ${sortedMidiChunks[sortedMidiChunks.length - 1].durationToPrevious}');
      /* Single tile will have duration is most popular of midi chunks */
      final unitDuration = sortCountDurationToPrevious.keys.last;

      final tiles = createTiles(tileChunks, unitDuration);
      print('There are ${tiles.length} tiles');
      final tick2Second =
          tickToSecond(midiFile.header.ticksPerBeat, value['bpm'] as int);
      final speedDpsPerTick = UNIT_DURATION_HEIGHT / unitDuration;
      final speedDpsPerSecond = speedDpsPerTick / tick2Second;
      final singleTileSeconds = unitDuration * tick2Second;
      if (singleTileSeconds < 0.2) {
        final newBpm =
            ((value['bpm'] as int) * (singleTileSeconds / 0.2)).toInt();
        print('WARNING Too fast $singleTileSeconds $key, set bpm to $newBpm');
        value['bpm'] = newBpm;
      }
      final pointCount = tiles.length;
      if (pointCount < 50) {
        print('WARNING Number tile to small $key, number tiles $pointCount');
      }
      final duration = (0.0 - tiles.last.initialY) / speedDpsPerSecond;
      print('Duration is $duration seconds');
      if (duration > 400) {
        print('WARNING  Too long ${duration / 60} minutes');
      }
      value['tilesCount'] = pointCount;
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
