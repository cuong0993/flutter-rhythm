import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sprintf/sprintf.dart';

import '../game/colors.dart';
import '../router/router.dart';
import '../songs/song.dart';
import 'game_config_model.dart';

class GameConfigPage extends HookWidget {
  final Song song;

  GameConfigPage({required this.song});

  @override
  Widget build(BuildContext context) {
    final gameConfigState = useProvider(gameConfigStateProvider);

    return Scaffold(
      appBar: AppBar(
          title: Text(L10n.of(context)!.txt_configure,
              style: Theme.of(context).appBarTheme.textTheme!.headline5)),
      body: SafeArea(
        child: Scrollbar(
          isAlwaysShown: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Text(L10n.of(context)!.txt_difficulty,
                        style: Theme.of(context).textTheme.headline5),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const SizedBox(width: 8),
                        CardWidget(
                          selected: gameConfigState.difficulty == 0,
                          text: L10n.of(context)!.txt_easy,
                          caption: sprintf(L10n.of(context)!.txt_fingers, [2]),
                          onTap: () {
                            context
                                .read(gameConfigStateProvider.notifier)
                                .changeDifficulty(0);
                          },
                        ),
                        const SizedBox(width: 8),
                        CardWidget(
                          selected: gameConfigState.difficulty == 1,
                          text: L10n.of(context)!.txt_medium,
                          caption: sprintf(L10n.of(context)!.txt_fingers, [3]),
                          onTap: () {
                            context
                                .read(gameConfigStateProvider.notifier)
                                .changeDifficulty(1);
                          },
                        ),
                        const SizedBox(width: 8),
                        CardWidget(
                          selected: gameConfigState.difficulty == 2,
                          text: L10n.of(context)!.txt_difficult,
                          caption: sprintf(L10n.of(context)!.txt_fingers, [4]),
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
                const SizedBox(height: 16),
                Column(
                  children: [
                    Text(L10n.of(context)!.txt_speed,
                        style: Theme.of(context).textTheme.headline5),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const SizedBox(width: 8),
                        CardWidget(
                          selected: gameConfigState.speed == 0,
                          text: L10n.of(context)!.txt_slow,
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
                          text: L10n.of(context)!.txt_normal,
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
                          text: L10n.of(context)!.txt_fast,
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ElevatedButton(
            onPressed: () {
              primaryColor = Theme.of(context).colorScheme.primary;
              secondaryColor = Theme.of(context).colorScheme.secondary;
              backgroundColor = Theme.of(context).colorScheme.background;
              onBackgroundColor = Theme.of(context).colorScheme.onBackground;
              paint = Paint()
                ..colorFilter = ColorFilter.mode(primaryColor, BlendMode.srcIn);
              AutoRouter.of(context)
                  .push(GameRoute(arguments: <String, dynamic>{
                'song': song,
                'difficulty': gameConfigState.difficulty,
                'speed': gameConfigState.speed
              }));
            },
            child: Text(L10n.of(context)!.txt_start)),
      ),
    );
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
