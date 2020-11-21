import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class PauseDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton (
            onPressed: () {Navigator.of(context).pop();Navigator.of(context).pop();},
            child: Text(S.of(context).txt_button_quit),
          ),
          ElevatedButton (
            onPressed: () {Navigator.of(context).pop();},
            child: Text(S.of(context).txt_button_restart),
          )
        ],
      ),
    );
  }
}
