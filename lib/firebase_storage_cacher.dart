import 'main.dart';

extension FirebasePathtoLocalPathConverter on String {
  String toLocalFilePath() {
    return applicationSupportPath + this;
  }
}
