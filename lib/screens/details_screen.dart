import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitnotes/blocs/game/game_bloc.dart';
import 'package:hitnotes/blocs/game/game_event.dart';
import 'package:hitnotes/blocs/game/game_state.dart';
import 'package:hitnotes/game/game.dart';
import 'package:hitnotes/models/song.dart';

class GameScreen extends StatelessWidget {
  final Song song;
  final MyGame game;

  GameScreen({Key key, @required this.song})
      : game = MyGame(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        BlocProvider.of<GameBloc>(context).add(StartGame(song));
        return Stack(children: <Widget>[
          game.widget,
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
            title: Text("aaaaaaaaaaaaaaaaaa"),
          ))
        ]);
      },
    );
  }
}

void _handleTap(BuildContext context, TapDownDetails details) {}
