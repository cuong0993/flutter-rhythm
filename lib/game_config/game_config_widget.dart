import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../generated/l10n.dart';
import '../routes.dart';
import '../songs/song.dart';
import 'game_config_bloc.dart';

class GameConfigWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final song = ModalRoute.of(context).settings.arguments as Song;
    return BlocBuilder<GameConfigBloc, GameConfigState>(
        builder: (context, state) {
      return Scaffold(
          appBar: AppBar(title: Text(S.of(context).txt_configure,
              style: Theme.of(context).appBarTheme.textTheme.headline5)),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).txt_difficulty,
                        style: Theme.of(context).textTheme.headline5),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SizedBox(width: 8),
                        CardWidget(
                          selected: state.difficulty == 0,
                          text: S.of(context).txt_easy,
                          caption: S.of(context).txt_fingers(2),
                          onTap: () {
                            BlocProvider.of<GameConfigBloc>(context)
                              ..add(GameConfigChangeDifficultyEvent(0));
                          },
                        ),
                        SizedBox(width: 8),
                        CardWidget(
                          selected: state.difficulty == 1,
                          text: S.of(context).txt_medium,
                          caption: S.of(context).txt_fingers(3),
                          onTap: () {
                            BlocProvider.of<GameConfigBloc>(context)
                              ..add(GameConfigChangeDifficultyEvent(1));
                          },
                        ),
                        SizedBox(width: 8),
                        CardWidget(
                          selected: state.difficulty == 2,
                          text: S.of(context).txt_difficult,
                          caption: S.of(context).txt_fingers(4),
                          onTap: () {
                            BlocProvider.of<GameConfigBloc>(context)
                              ..add(GameConfigChangeDifficultyEvent(2));
                          },
                        ),
                        SizedBox(width: 8)
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).txt_speed,
                        style: Theme.of(context).textTheme.headline5),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SizedBox(width: 8),
                        CardWidget(
                          selected: state.speed == 0,
                          text: S.of(context).txt_slow,
                          caption: 'x0.75',
                          onTap: () {
                            BlocProvider.of<GameConfigBloc>(context)
                              ..add(GameConfigChangeSpeedEvent(0));
                          },
                        ),
                        SizedBox(width: 8),
                        CardWidget(
                          selected: state.speed == 1,
                          text: S.of(context).txt_normal,
                          caption: 'x1.0',
                          onTap: () {
                            BlocProvider.of<GameConfigBloc>(context)
                              ..add(GameConfigChangeSpeedEvent(1));
                          },
                        ),
                        SizedBox(width: 8),
                        CardWidget(
                          selected: state.speed == 2,
                          text: S.of(context).txt_fast,
                          caption: 'x1.25',
                          onTap: () {
                            BlocProvider.of<GameConfigBloc>(context)
                              ..add(GameConfigChangeSpeedEvent(2));
                          },
                        ),
                        SizedBox(width: 8)
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.game, arguments: {
                            'song': song,
                            'difficulty': state.difficulty,
                            'speed': state.speed
                          });
                        },
                        child: Text(S.of(context).txt_start)),
                  ),
                  SizedBox(width: 8)
                ],
              )
            ],
          ));
    });
  }
}

class CardWidget extends StatelessWidget {
  final bool selected;
  final String text;
  final String caption;
  final GestureTapCallback onTap;

  const CardWidget({
    Key key,
    @required this.selected,
    @required this.text,
    @required this.caption,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: selected
            ? ElevatedButton(
                onPressed: () {
                  onTap();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 8),
                    Text(text),
                    SizedBox(height: 8),
                    Text(caption),
                    SizedBox(height: 8),
                  ],
                ))
            : OutlinedButton(
                onPressed: () {
                  onTap();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 8),
                    Text(text),
                    SizedBox(height: 8),
                    Text(caption),
                    SizedBox(height: 8),
                  ],
                )));
  }
}
