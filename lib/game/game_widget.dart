import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../generated/l10n.dart';
import '../songs/song.dart';
import '../util.dart';
import 'game_bloc.dart';
import 'game_event.dart';
import 'game_state.dart';
import 'my_game.dart';
import 'pause_dialog.dart';
import 'tile/tile.dart';

class GameWidget extends StatefulWidget {
  final MyGame _game;

  GameWidget({Key key})
      : _game = MyGame(),
        super(key: key);

  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  @override
  void initState() {
    BlocProvider.of<GameBloc>(context).pauseStream.listen((event) {
      showDialog<void>(
        context: context,
        builder: (_) => PauseDialog(),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _onTileTouched(Tile tile) {
      BlocProvider.of<GameBloc>(context).add(TileTouched(tile));
    }

    return WillPopScope(onWillPop: () async {
      await showDialog<void>(
        context: context,
        builder: (_) => PauseDialog(),
      );
      return Future.value(false);
    }, child: BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (state is GameLoading) {
          final song = ModalRoute
              .of(context)
              .settings
              .arguments as Song;
          BlocProvider.of<GameBloc>(context).add(StartGame(song));
          return LoadingSoundWidget();
        } else if (state is GameStarted) {
          widget._game.start(
              state.tiles, state.speedPixelsPerSecond, _onTileTouched);
          return LoadingSoundWidget();
        }
        return Stack(children: [
          widget._game.widget,
          Container(
              height: NON_TOUCH_REGION_HEIGHT.toDouble(),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  children: [
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      animation: true,
                      animationDuration: 0,
                      lineHeight: 8.0,
                      percent: (state as GameUpdated).time /
                          (state as GameUpdated).maxTime,
                      linearStrokeCap: LinearStrokeCap.butt,
                      progressColor: Colors.red,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text((state as GameUpdated).songName),
                        Text(
                            '${(state as GameUpdated).time.toInt() ~/
                                60}:${((state as GameUpdated).time.toInt() % 60)
                                .toString()
                                .padLeft(2, '0')}/${(state as GameUpdated)
                                .maxTime.toInt() ~/
                                60}:${((state as GameUpdated)
                                .maxTime.toInt() % 60).toString().padLeft(
                                2, '0')}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.pause_circle_outline_rounded),
                          onPressed: () {
                            BlocProvider.of<GameBloc>(context).add(
                                PauseGame());
                          },
                        ),
                        Text((state as GameUpdated).tilesCount.toString())
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [ GuideTextWidget()],
                    )
                  ],
                ),
              ))
        ]);
      },
    )
    );
  }
}

class GuideTextWidget extends StatefulWidget {
  @override
  _GuideTextWidgetState createState() => _GuideTextWidgetState();
}

class _GuideTextWidgetState extends State<GuideTextWidget> {
  String _text = '';

  @override
  void initState() {
    BlocProvider.of<GameBloc>(context).guideStream.listen((event) {
      setState(() {
        if (event == 'slow') {
          _text = S.of(context).txt_too_late;
        } else if (event == 'fast') {
          _text = S.of(context).txt_too_early;
        } else if (event == 'normal') {
          _text = '';
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text('$_text');
  }
}

class LoadingSoundWidget extends StatelessWidget {
  const LoadingSoundWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Image(
                      image:
                      AssetImage('assets/images/img_app_icon.png')),
                ),
              ),
              Text(S
                  .of(context)
                  .txt_dialog_loading_sound_description)
            ],
          )),
    );
  }
}
