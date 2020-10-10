import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hitnotes/game/game.dart';
import 'package:hitnotes/models/song.dart';

class GameScreen extends StatelessWidget {
  final MyGame game;

  GameScreen({Key key, Song song})
      : game = MyGame(song: song),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return game.widget;
  }
}
