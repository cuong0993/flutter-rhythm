import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sprintf/sprintf.dart';

import '../game/game_model.dart';
import '../routes.dart';
import '../songs/song.dart';
import 'game_config_model.dart';

class GameConfigWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final song = ModalRoute.of(context)!.settings.arguments as Song;
    final gameConfigState = watch(gameConfigStateProvider);

    return Scaffold(
        appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.txt_configure,
                style: Theme.of(context).appBarTheme.textTheme!.headline5)),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.txt_difficulty,
                        style: Theme.of(context).textTheme.headline5),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const SizedBox(width: 8),
                        CardWidget(
                          selected: gameConfigState.difficulty == 0,
                          text: AppLocalizations.of(context)!.txt_easy,
                          caption: sprintf(
                              AppLocalizations.of(context)!.txt_fingers, [2]),
                          onTap: () {
                            context
                                .read(gameConfigStateProvider.notifier)
                                .changeDifficulty(0);
                          },
                        ),
                        const SizedBox(width: 8),
                        CardWidget(
                          selected: gameConfigState.difficulty == 1,
                          text: AppLocalizations.of(context)!.txt_medium,
                          caption: sprintf(
                              AppLocalizations.of(context)!.txt_fingers, [3]),
                          onTap: () {
                            context
                                .read(gameConfigStateProvider.notifier)
                                .changeDifficulty(1);
                          },
                        ),
                        const SizedBox(width: 8),
                        CardWidget(
                          selected: gameConfigState.difficulty == 2,
                          text: AppLocalizations.of(context)!.txt_difficult,
                          caption: sprintf(
                              AppLocalizations.of(context)!.txt_fingers, [4]),
                          onTap: () {
                            context
                                .read(gameConfigStateProvider.notifier)
                                .changeDifficulty(2);
                          },
                        ),
                        const SizedBox(width: 8)
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
                    Text(AppLocalizations.of(context)!.txt_speed,
                        style: Theme.of(context).textTheme.headline5),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const SizedBox(width: 8),
                        CardWidget(
                          selected: gameConfigState.speed == 0,
                          text: AppLocalizations.of(context)!.txt_slow,
                          caption: 'x0.75',
                          onTap: () {
                            context
                                .read(gameConfigStateProvider.notifier)
                                .changeSpeed(0);
                          },
                        ),
                        const SizedBox(width: 8),
                        CardWidget(
                          selected: gameConfigState.speed == 1,
                          text: AppLocalizations.of(context)!.txt_normal,
                          caption: 'x1.0',
                          onTap: () {
                            context
                                .read(gameConfigStateProvider.notifier)
                                .changeSpeed(1);
                          },
                        ),
                        const SizedBox(width: 8),
                        CardWidget(
                          selected: gameConfigState.speed == 2,
                          text: AppLocalizations.of(context)!.txt_fast,
                          caption: 'x1.25',
                          onTap: () {
                            context
                                .read(gameConfigStateProvider.notifier)
                                .changeSpeed(2);
                          },
                        ),
                        const SizedBox(width: 8)
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          context.read(gameStateProvider.notifier).startGame(
                              song,
                              gameConfigState.difficulty,
                              gameConfigState.speed);
                          Navigator.pushNamed(context, Routes.game);
                        },
                        child: Text(AppLocalizations.of(context)!.txt_start)),
                  ),
                  const SizedBox(width: 8)
                ],
              )
            ],
          ),
        ));
  }
}

class CardWidget extends StatelessWidget {
  final bool selected;
  final String text;
  final String caption;
  final GestureTapCallback onTap;

  const CardWidget({
    Key? key,
    required this.selected,
    required this.text,
    required this.caption,
    required this.onTap,
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
                    const SizedBox(height: 8),
                    Text(text),
                    const SizedBox(height: 8),
                    Text(caption),
                    const SizedBox(height: 8),
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
                    const SizedBox(height: 8),
                    Text(text),
                    const SizedBox(height: 8),
                    Text(caption),
                    const SizedBox(height: 8),
                  ],
                )));
  }
}
