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
                  Image(image: AssetImage('assets/images/img_firework.png')),
                  Text(
                    S.of(context).txt_game_complete_gift,
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
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
