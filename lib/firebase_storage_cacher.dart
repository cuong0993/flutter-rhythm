import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import 'main.dart';

extension FirebasePathtoLocalPathConverter on String {
  String toLocalFilePath() {
    return applicationSupportPath + this;
  }
}

extension FirebasePathtoLocalPathConverter1 on FirebaseStorage {
  Future<void> tryToSaveFile(String url) async {
    final path = url.toLocalFilePath();
    final file = File(path);
    if (file.existsSync()) {
      return;
    } else {
      await file.create(recursive: true);
      await FirebaseStorage.instance.ref().child(url).writeToFile(file).future;
    }
  }
}
