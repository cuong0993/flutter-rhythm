import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/l10n.dart';

import 'game_reward.dart';

class CompleteWidget extends StatelessWidget {
  const CompleteWidget({
    required this.gameReward,
    required this.onRestart,
    Key? key,
  }) : super(key: key);

  final GameReward gameReward;
  final Function() onRestart;

  @override
  Widget build(BuildContext context) => Material(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Align(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage(
                              (gameReward.stars >= 1)
                                  ? 'assets/images/img_star_rate.png'
                                  : 'assets/images/img_star_rate_disable.png',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Image(
                            image: AssetImage(
                              (gameReward.stars >= 2)
                                  ? 'assets/images/img_star_rate.png'
                                  : 'assets/images/img_star_rate_disable.png',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Image(
                            image: AssetImage(
                              (gameReward.stars >= 3)
                                  ? 'assets/images/img_star_rate.png'
                                  : 'assets/images/img_star_rate_disable.png',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                            image: AssetImage('assets/images/img_note.png'),
                          ),
                          const SizedBox(width: 8),
                          Text(gameReward.playedNotes.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: Text(L10n.of(context)!.txt_button_quit),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onRestart,
                      child: Text(L10n.of(context)!.txt_button_restart),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      );
}
