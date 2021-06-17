import 'package:flame/game.dart' as flame;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../midi/midi_model.dart';
import 'colors.dart';
import 'complete_widget.dart';
import 'game_model.dart';
import 'game_state.dart';
import 'pause_dialog.dart';

class GamePage extends HookWidget {
  final Map<String, dynamic> arguments;

  const GamePage({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final midiLoaded = useProvider(midiProvider);
    if (!midiLoaded) {
      return const LoadingSoundWidget();
    }

    final gameStateProvider = gameStateFamilyProvider(arguments);
    final gameState = useProvider(gameStateProvider);
    void _onRestart() {
      context.read(gameStateProvider.notifier).onRestart();
    }

    return ProviderListener(
      provider: isPausedProvider,
      onChange: (context, gameState) {
        showDialog<void>(
          context: context,
          useSafeArea: false,
          builder: (_) => PauseDialog(onRestart: _onRestart),
        );
      },
      child: WillPopScope(
        onWillPop: () {
          context.read(isPausedProvider).state = true;
          return Future.value(false);
        },
        child: Material(
          child: () {
            if (gameState is GameStateLoading) {
              return const LoadingSoundWidget();
            } else if (gameState is GameStateGettingGift) {
              return const LoadingGiftWidget();
            } else if (gameState is GameStateCompleted) {
              return CompleteWidget(
                  gameReward: gameState.gameReward, onRestart: _onRestart);
            } else if (gameState is GameStatePlaying) {
              return Stack(children: [
                flame.GameWidget(
                    game: context.read(gameStateProvider.notifier).game),
                Align(
                    alignment: Alignment.topCenter,
                    child: SafeArea(
                      child: Column(
                        children: [
                          HookBuilder(
                            builder: (context) {
                              final time = useProvider(timeProvider).state;
                              return LinearProgressIndicator(
                                backgroundColor:
                                    onBackgroundColor.withOpacity(0.1),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    secondaryColor),
                                value: time / gameState.duration,
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text((gameState).songName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6),
                                    HookBuilder(
                                      builder: (context) {
                                        final time =
                                            useProvider(timeProvider).state;
                                        return Text(
                                            '${time.toInt() ~/ 60}:${(time.toInt() % 60).toString().padLeft(2, '0')}/${gameState.duration.toInt() ~/ 60}:${(gameState.duration.toInt() % 60).toString().padLeft(2, '0')}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6);
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      iconSize: 38,
                                      icon: const Icon(
                                          Icons.pause_circle_outline_rounded),
                                      onPressed: () {
                                        context.read(isPausedProvider).state =
                                            true;
                                      },
                                    ),
                                    HookBuilder(
                                      builder: (context) {
                                        final tilesCount =
                                            useProvider(tilesCountProvider)
                                                .state;
                                        return Text(tilesCount.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                    color: secondaryColor));
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [GuideTextWidget()],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
              ]);
            } else {
              return const SizedBox.shrink();
            }
          }(),
        ),
      ),
    );
  }
}

class GuideTextWidget extends HookWidget {
  const GuideTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final guideText = useProvider(guideTextProvider).state;
    var text = '';
    if (guideText == 'txt_too_late') {
      text = L10n.of(context)!.txt_too_late;
    } else if (guideText == 'txt_too_early') {
      text = L10n.of(context)!.txt_too_early;
    } else if (guideText == 'txt_too_many_fingers') {
      text = L10n.of(context)!.txt_too_many_fingers;
    }
    return Text(text,
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image(
                        image: AssetImage('assets/images/img_app_icon.png')),
                  ),
                ),
                Text(L10n.of(context)!.txt_dialog_loading_sound_description)
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image(
                        image: AssetImage('assets/images/img_app_icon.png')),
                  ),
                ),
                Text(L10n.of(context)!.txt_game_complete_loading_gift)
              ],
            )),
      ),
    );
  }
}
