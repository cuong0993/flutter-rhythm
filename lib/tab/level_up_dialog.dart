import 'package:flutter/material.dart';

import 'base_dialog.dart';

class LevelUpDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: '提示',
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Image(image: AssetImage('assets/images/img_firework.png')),
      ),
      onPressed: () {
       /// NavigatorUtils.push(context, LoginRouter.loginPage, clearStack: true);
      },
    );
  }
}
