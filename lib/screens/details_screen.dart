import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitnotes/blocs/game/game_bloc.dart';
import 'package:hitnotes/blocs/game/game_event.dart';
import 'package:hitnotes/blocs/game/game_state.dart';
import 'package:hitnotes/game/game.dart';
import 'package:hitnotes/models/song.dart';
import 'package:hitnotes/screens/menu.dart';

class GameScreen extends StatelessWidget {
  final Song song;
  final MyGame game;
  final Menu menu;

  GameScreen({Key key, @required this.song})
      : game = MyGame(),
        menu = Menu(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        BlocProvider.of<GameBloc>(context).add(StartGame(song));
        return Stack(
          children: <Widget>[game.widget, menu],
        );
      },
    );
  }
}

void _handleTap(BuildContext context, TapDownDetails details) {}
