import 'dart:convert';
import 'dart:io';

void main() {
  File('database/db.json')
      .readAsString()
      .then((fileContents) => json.decode(fileContents))
      .then((jsonData) {
    final dir = Directory('storage/sounds');
    final collections = jsonData['__collections__'];
    final instruments = {};
    dir
        .listSync(recursive: true)
        .whereType<Directory>()
        .toList()
        .forEach((childDir) {
      final id = childDir.path.split('/').last;
      final instrument = {};
      final soundPaths = {};
      childDir
          .listSync(recursive: true)
          .whereType<File>()
          .toList()
          .forEach((file) {
        soundPaths[file.path.split('/').last.split('.').first] =
            file.path.replaceAll('storage/', '');
      });
      final notes = soundPaths.keys.map((e) => int.parse(e)).toList()..sort();
      final maxNote = notes.last;
      final minNote = notes.first;
      var i = 0;
      final baseNotes = {};
      for (var note = minNote; note <= maxNote; note++) {
        if ((i + 1) < notes.length && note >= notes[i + 1]) {
          i++;
        } else if ((i + 1) < notes.length && note > (notes[i] + 2)) {
          i++;
        }
        final int = notes[i].toInt();
        baseNotes[note.toString()] = int;
      }

      instrument['id'] = id;
      instrument['maxNote'] = maxNote;
      instrument['minNote'] = minNote;
      instrument['soundPaths'] = soundPaths;
      instrument['baseNotes'] = baseNotes;
      instrument['__collections__'] = {};
      instruments[id] = instrument;
    });
    collections['instruments'] = instruments;
    jsonData['__collections__'] = collections;
    File('database/db.json').writeAsStringSync(json.encode(jsonData));
  });
}
