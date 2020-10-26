import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class LevelUpDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(S.of(context).txt_dialog_level_up_name),
        ),
        body: Align(
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
        bottomNavigationBar: Row(
          children: [
            SizedBox(width: 8),
            Expanded(
              child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  S.of(context).txt_all_ok,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(width: 8)
          ],
        ));
  }
}
