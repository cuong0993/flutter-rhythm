import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/l10n.dart';

class PauseDialog extends StatelessWidget {
  const PauseDialog({
    required this.onRestart,
    Key? key,
  }) : super(key: key);

  final Function() onRestart;

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text(L10n.of(context)!.txt_button_quit),
              ),
              ElevatedButton(
                onPressed: () {
                  onRestart();
                  Navigator.of(context).pop();
                },
                child: Text(L10n.of(context)!.txt_button_restart),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(L10n.of(context)!.txt_game_button_continue),
              )
            ],
          ),
        ),
      );
}
