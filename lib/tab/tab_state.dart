import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../instrument/instruments_widget.dart';
import '../my_flutter_app_icons.dart';
import '../songs/songs_widget.dart';
import '../user/user_widget.dart';

enum TabState { songs, stats, user }

extension AppTabExtension on TabState {
  String get name {
    switch (this) {
      case TabState.songs:
        return 'login';
      case TabState.stats:
        return 'email';
      case TabState.user:
        return 'user';
      default:
        return null;
    }
  }

  Widget get icon {
    switch (this) {
      case TabState.songs:
        return Icon(Icons.library_music);
      case TabState.stats:
        return Icon(MyFlutterApp.img_guitar);
      case TabState.user:
        return Icon(Icons.account_circle);
      default:
        return null;
    }
  }

  Widget get widget {
    switch (this) {
      case TabState.songs:
        return SongsWidget();
      case TabState.stats:
        return InstrumentsWidget();
      case TabState.user:
        return UserWidget();
      default:
        return null;
    }
  }
}
