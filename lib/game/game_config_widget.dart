import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../routes.dart';
import '../songs/song.dart';

class GameConfigWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final song = ModalRoute.of(context).settings.arguments as Song;
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).txt_configure)),
        body: Column(
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
                              image: AssetImage(
                                  'assets/images/img_star_rate.png')),
                          SizedBox(width: 8),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              image: AssetImage('assets/images/img_note.png')),
                          SizedBox(width: 8),
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
                        Navigator.pushNamed(context, Routes.game,
                            arguments: song);
                      },
                      child: Text(S.of(context).txt_start)),
                ),
                SizedBox(width: 8)
              ],
            )
          ],
        ));
  }
}
