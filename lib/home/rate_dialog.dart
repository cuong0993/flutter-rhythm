import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

import '../generated/l10n.dart';
import '../preferences.dart';

class RateDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Text(
                      S.of(context).txt_dialog_rate_description,
                      style: Theme.of(context).textTheme.headline6,
                    )),
              ),
            ),
            Row(
              children: [
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(S.of(context).txt_all_no),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
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
                  child: ElevatedButton(
                      onPressed: () {
                        Preferences.getInstance().then((preferences) {
                          preferences.isShowRateDialogAgain = false;
                        });
                        Navigator.of(context).pop();
                        final _inAppReview = InAppReview.instance;
                        _inAppReview.openStoreListing(
                          appStoreId: '_appStoreId',
                          microsoftStoreId: '_microsoftStoreId',
                        );
                      },
                      child: Text(S.of(context).txt_all_ok)),
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
