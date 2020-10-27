import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

import '../generated/l10n.dart';
import '../preferences.dart';

class RateDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(S.of(context).txt_dialog_rate_name),
        ),
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(S.of(context).txt_dialog_rate_description)],
          ),
        ),
        bottomNavigationBar: Row(
          children: [
            SizedBox(width: 8),
            Expanded(
              child: RaisedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(S.of(context).txt_all_no),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: RaisedButton(
                onPressed: () {
                  Preferences.getInstance().then((preferences) {
                    preferences.isShowRateDialogAgain = true;
                  });
                  Navigator.of(context).pop();
                },
                child: Text(S.of(context).txt_dialog_rate_button_remind),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: RaisedButton(
                onPressed: () {
                  Preferences.getInstance().then((preferences) {
                    preferences.isShowRateDialogAgain = false;
                  });
                  Navigator.of(context).pop();
                  final _inAppReview = InAppReview.instance;
                  _inAppReview.openStoreListing(
                    appStoreId: "_appStoreId",
                    microsoftStoreId: "_microsoftStoreId",
                  );
                },
                child: Text(S.of(context).txt_all_ok),
              ),
            ),
            SizedBox(width: 8)
          ],
        ));
  }
}
