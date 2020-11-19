import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../user/user_repository.dart';

class LevelUpDialog extends StatelessWidget {
  final AppUser _appUser;

  const LevelUpDialog(this._appUser);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                    S
                        .of(context)
                        .txt_dialog_level_up_description(_appUser.user.level),
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
                child: RaisedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(S.of(context).txt_all_ok),
                ),
              ),
              SizedBox(width: 8)
            ],
          )
        ],
      ),
    );
  }
}
