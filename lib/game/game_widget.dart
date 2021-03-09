import 'dart:async';

import 'package:flame/game.dart' as flame;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../main.dart';
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

  GameWidget({Key? key})
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
        useSafeArea: false,
        builder: (_) => PauseDialog(_onRestart),
      );
    });
    BlocProvider.of<GameBloc>(context).completeStream.listen((event) {
      showDialog<void>(
        context: context,
        useSafeArea: false,
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

    void _onTileTouched(Tile? tile) {
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
          final arguments = (ModalRoute.of(context)!.settings.arguments as Map);
          final song = arguments['song'];
          final difficulty = arguments['difficulty'];
          final speed = arguments['speed'];
          BlocProvider.of<GameBloc>(context)
              .add(StartGame(song, difficulty, speed));
          return LoadingSoundWidget();
        } else if (state is GameStarted) {
          widget._game.start(state.tiles, state.speedPixelsPerSecond,
              _onTileTouched, _onCompleted);
          return LoadingSoundWidget();
        } else if (state is LoadingGift) {
          return LoadingGiftWidget();
        }
        return Stack(children: [
          flame.GameWidget(game: widget._game),
          Container(
              height: NON_TOUCH_REGION_HEIGHT.toDouble(),
              child: Material(
                color: Colors.transparent,
                child: SafeArea(
                  child: Column(
                    children: [
                      LinearProgressIndicator(
                        backgroundColor: onBackgroundColor.withOpacity(0.1),
                        valueColor:
                            AlwaysStoppedAnimation<Color>(secondaryColor),
                        value: (state as GameUpdated).time / (state).maxTime,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text((state).songName,
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                Text(
                                    '${(state).time.toInt() ~/ 60}:${((state).time.toInt() % 60).toString().padLeft(2, '0')}/${(state).maxTime.toInt() ~/ 60}:${((state).maxTime.toInt() % 60).toString().padLeft(2, '0')}',
                                    style:
                                        Theme.of(context).textTheme.headline6)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  iconSize: 38,
                                  icon:
                                      Icon(Icons.pause_circle_outline_rounded),
                                  onPressed: () {
                                    BlocProvider.of<GameBloc>(context)
                                        .add(PauseGame());
                                  },
                                ),
                                Text((state).tilesCount.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(color: secondaryColor))
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
  late StreamSubscription _userSubscription;

  @override
  void initState() {
    _userSubscription =
        BlocProvider.of<GameBloc>(context).guideStream.listen((event) {
      setState(() {
        if (event == 'txt_too_late') {
          _text = AppLocalizations.of(context)!.txt_too_late;
        } else if (event == 'txt_too_early') {
          _text = AppLocalizations.of(context)!.txt_too_early;
        } else if (event == 'txt_too_many_fingers') {
          _text = AppLocalizations.of(context)!.txt_too_many_fingers;
        } else if (event == '') {
          _text = '';
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _userSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text('$_text',
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(color: primaryColor));
  }
}

class LoadingSoundWidget extends StatelessWidget {
  const LoadingSoundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
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
                Text(AppLocalizations.of(context)!
                    .txt_dialog_loading_sound_description)
              ],
            )),
      ),
    );
  }
}

class LoadingGiftWidget extends StatelessWidget {
  const LoadingGiftWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
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
                Text(AppLocalizations.of(context)!
                    .txt_game_complete_loading_gift)
              ],
            )),
      ),
    );
  }
}
