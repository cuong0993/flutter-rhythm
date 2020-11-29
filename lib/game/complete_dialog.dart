import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import 'game_reward.dart';

class CompleteDialog extends StatelessWidget {
  final GameReward _gameReward;
  final Function() _onRestart;

  const CompleteDialog(this._gameReward, this._onRestart);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            image: AssetImage((_gameReward.stars >= 1)
                                ? 'assets/images/img_star_rate.png'
                                : 'assets/images/img_star_rate_disable.png')),
                        SizedBox(width: 8),
                        Image(
                            image: AssetImage((_gameReward.stars >= 2)
                                ? 'assets/images/img_star_rate.png'
                                : 'assets/images/img_star_rate_disable.png')),
                        SizedBox(width: 8),
                        Image(
                            image: AssetImage((_gameReward.stars >= 3)
                                ? 'assets/images/img_star_rate.png'
                                : 'assets/images/img_star_rate_disable.png')),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage('assets/images/img_note.png')),
                        SizedBox(width: 8),
                        Text(_gameReward.experiences.toString())
                      ],
                    ),
                  ],
                )),
          ),
          Row(
            children: [
              SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text(S.of(context).txt_button_quit),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      _onRestart();
                      Navigator.of(context).pop();
                    },
                    child: Text(S.of(context).txt_button_restart)),
              ),
              SizedBox(width: 8)
            ],
          )
        ],
      ),
    );
  }
}
