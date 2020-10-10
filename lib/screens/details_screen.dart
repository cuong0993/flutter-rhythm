import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitnotes/blocs/game/game_bloc.dart';
import 'package:hitnotes/blocs/game/game_event.dart';
import 'package:hitnotes/blocs/game/game_state.dart';
import 'package:hitnotes/game/game.dart';
import 'package:hitnotes/models/song.dart';

class GameScreen extends StatelessWidget {
  final Widget game;
  final Song song;

  GameScreen({Key key, this.song})
      : game = MyGame(song: song).widget,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        BlocProvider.of<GameBloc>(context).add(StartGame(song));
        return Stack(children: [
          game,
          Container(
            height: kToolbarHeight,
            child: AppBar(
              title: Text("song.title"),
            ),
          )
        ]);
      },
    );
  }
}
