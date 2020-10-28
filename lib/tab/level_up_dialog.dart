import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class LevelUpDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(S.of(context).txt_dialog_level_up_name),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage('assets/images/img_firework.png')),
                    Text(S.of(context).txt_dialog_level_up_description('1'))
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
      ),
    );
  }
}
