import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// class LevelUpDialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('txt_dialog_level_up_name'.tr()),
//       content: Image(image: AssetImage('assets/images/img_firework.png')),
//       actions: [
//         Expanded(
//           child: Container(
//             padding: EdgeInsets.all(16.0),
//             decoration: BoxDecoration(
//               color: const Color(0xFF33b17c),
//             ),
//             child: Text(
//               'txt_all_ok'.tr(),
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18.0,
//                 fontFamily: 'helvetica_neue_light',
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class LevelUpDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('txt_dialog_level_up_name'.tr()),
        ),
        body: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Image(image: AssetImage('assets/images/img_firework.png')),
              Text('txt_dialog_level_up_description'.tr(args: [1.toString()]))
            ],
          ),
        ),
        bottomNavigationBar: Row(
          children: [
            SizedBox(width: 10),
            Expanded(
              child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {},
                child: Text(
                  'txt_all_ok'.tr(),
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(width: 10)
          ],
        ));
  }
}
