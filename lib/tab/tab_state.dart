import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../instrument/instruments_widget.dart';
import '../my_flutter_app_icons.dart';
import '../songs/songs_widget.dart';
import '../user/user_widget.dart';

enum TabState { instruments, songs, user }

extension AppTabExtension on TabState {
  String get name {
    switch (this) {
      case TabState.instruments:
        return 'txt_instrument_title_instruments';
      case TabState.songs:
        return 'txt_all_songs';
      case TabState.user:
        return 'txt_page_title_about';
      default:
        return null;
    }
  }

  Widget get icon {
    switch (this) {
      case TabState.instruments:
        return Icon(MyFlutterApp.img_guitar);
      case TabState.songs:
        return Icon(Icons.library_music);
      case TabState.user:
        return Icon(Icons.account_circle);
      default:
        return null;
    }
  }

  Widget get widget {
    switch (this) {
      case TabState.instruments:
        return InstrumentsWidget();
      case TabState.songs:
        return SongsWidget();
      case TabState.user:
        return UserWidget();
      default:
        return null;
    }
  }
}
