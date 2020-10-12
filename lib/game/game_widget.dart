import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../songs/song.dart';
import 'game_bloc.dart';
import 'game_event.dart';
import 'game_state.dart';
import 'my_game.dart';
import 'tile/tile.dart';

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

  void _onTileTouched(Tile tile) {
    BlocProvider.of<GameBloc>(context).add(TileTouched(tile));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (state is GameStarted) {
          widget._game
              .start(state.tiles, state.speedPixelsPerSecond, _onTileTouched);
          return Stack(children: [
            widget._game.widget,
            Container(
              height: kToolbarHeight + MediaQuery.of(context).padding.top,
              child: LinearPercentIndicator(
                width: 170.0,
                animation: true,
                animationDuration: 1000,
                lineHeight: 20.0,
                percent: 0.2,
                center: Text('20.0%'),
                linearStrokeCap: LinearStrokeCap.butt,
                progressColor: Colors.red,
              ),
            )
          ]);
        }
        if (state is GameUpdated) {
          return Stack(children: [
            widget._game.widget,
            Container(
              height: kToolbarHeight + MediaQuery.of(context).padding.top,
              child: AppBar(
                title: Text(widget.song.title + state.aaaaaaa.toString()),
              ),
            )
          ]);
        }
        return Stack(children: [
          widget._game.widget,
          Container(
            height: kToolbarHeight + MediaQuery.of(context).padding.top,
            child: AppBar(
              title: Text(widget.song.title),
            ),
          )
        ]);
      },
    );
  }
}
