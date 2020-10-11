import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitnotes/blocs/game/game_bloc.dart';
import 'package:hitnotes/blocs/game/game_event.dart';
import 'package:hitnotes/blocs/game/game_state.dart';
import 'package:hitnotes/game/game.dart';
import 'package:hitnotes/models/song.dart';

class GameScreen extends StatefulWidget {
  final MyGame _game;
  final Song song;

  GameScreen({Key key, this.song})
      : _game = MyGame(),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
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
