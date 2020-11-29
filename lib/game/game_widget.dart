import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../generated/l10n.dart';
import '../songs/song.dart';
import 'complete_dialog.dart';
import 'game_bloc.dart';
import 'game_event.dart';
import 'game_state.dart';
import 'my_game.dart';
import 'pause_dialog.dart';
import 'tile/tile.dart';
import 'tile/tile_converter.dart';

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
    void _onRestart() {
      BlocProvider.of<GameBloc>(context).add(RestartGame());
    }

    BlocProvider.of<GameBloc>(context).pauseStream.listen((event) {
      showDialog<void>(
        context: context,
        builder: (_) => PauseDialog(_onRestart),
      );
    });
    BlocProvider.of<GameBloc>(context).completeStream.listen((event) {
      showDialog<void>(
        context: context,
        builder: (_) => CompleteDialog(event, _onRestart),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _onRestart() {
      BlocProvider.of<GameBloc>(context).add(RestartGame());
    }

    void _onTileTouched(Tile tile) {
      BlocProvider.of<GameBloc>(context).add(TileTouched(tile));
    }

    void _onCompleted() {
      BlocProvider.of<GameBloc>(context).add(CompleteGame());
    }

    return WillPopScope(onWillPop: () async {
      await showDialog<void>(
        context: context,
        builder: (_) => PauseDialog(_onRestart),
      );
      return Future.value(false);
    }, child: BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (state is GameLoading) {
          final song = ModalRoute.of(context).settings.arguments as Song;
          BlocProvider.of<GameBloc>(context).add(StartGame(song));
          return LoadingSoundWidget();
        } else if (state is GameStarted) {
          widget._game.start(state.tiles, state.speedPixelsPerSecond,
              _onTileTouched, _onCompleted);
          return LoadingSoundWidget();
        } else if (state is LoadingGift) {
          return LoadingGiftWidget();
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
                      progressColor: Color(0xFFFF8383),
                      backgroundColor: Color(0xFFFFFFFF).withOpacity(0.1),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text((state as GameUpdated).songName,
                                  style: Theme.of(context).textTheme.headline6),
                              Text(
                                  '${(state as GameUpdated).time.toInt() ~/ 60}:${((state as GameUpdated).time.toInt() % 60).toString().padLeft(2, '0')}/${(state as GameUpdated).maxTime.toInt() ~/ 60}:${((state as GameUpdated).maxTime.toInt() % 60).toString().padLeft(2, '0')}',
                                  style: Theme.of(context).textTheme
                                      .subtitle1)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                iconSize: 38,
                                icon: Icon(Icons.pause_circle_outline_rounded),
                                onPressed: () {
                                  BlocProvider.of<GameBloc>(context)
                                      .add(PauseGame());
                                },
                              ),
                              Text((state as GameUpdated).tilesCount.toString(),
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(color: Color(0xFFFF8383)))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [GuideTextWidget()],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ]);
      },
    ));
  }
}

class GuideTextWidget extends StatefulWidget {
  @override
  _GuideTextWidgetState createState() => _GuideTextWidgetState();
}

class _GuideTextWidgetState extends State<GuideTextWidget> {
  String _text = '';
  StreamSubscription _userSubscription;

  @override
  void initState() {
    _userSubscription =
        BlocProvider.of<GameBloc>(context).guideStream.listen((event) {
      setState(() {
        if (event == 'txt_too_late') {
          _text = S.of(context).txt_too_late;
        } else if (event == 'txt_too_early') {
          _text = S.of(context).txt_too_early;
        } else if (event == 'txt_too_many_fingers') {
          _text = S.of(context).txt_too_many_fingers;
        } else if (event == '') {
          _text = '';
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _userSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text('$_text',
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(color: Color(0xFF1CDEC9)));
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
                      image: AssetImage('assets/images/img_app_icon.png')),
                ),
              ),
              Text(S.of(context).txt_dialog_loading_sound_description)
            ],
          )),
    );
  }
}

class LoadingGiftWidget extends StatelessWidget {
  const LoadingGiftWidget({
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
                      image: AssetImage('assets/images/img_app_icon.png')),
                ),
              ),
              Text(S.of(context).txt_game_complete_loading_gift)
            ],
          )),
    );
  }
}
