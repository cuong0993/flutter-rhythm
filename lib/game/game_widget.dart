import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../songs/song.dart';
import 'game_bloc.dart';
import 'game_event.dart';
import 'game_state.dart';
import 'my_game.dart';

class GameWidget extends StatefulWidget {
  final MyGame _game;
  final Song song;

  GameWidget({Key key, this.song})
      : _game = MyGame(),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GameBloc>(context).add(StartGame(widget.song));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (state is GameStarted) {
          widget._game.start(state.tiles, state.speedPixelsPerSecond);
        }
        return Stack(children: [widget._game.widget]);
      },
    );
  }
}
