import 'package:flutter/material.dart';

class LevelUpDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('AlertDialog'),
      content: Image(image: AssetImage('assets/images/img_firework.png')),
      actions: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color(0xFF33b17c),
            ),
            child: Text(
              'Rate product',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontFamily: 'helvetica_neue_light',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
