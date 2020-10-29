import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:in_app_review/in_app_review.dart';

import 'generated/l10n.dart';


class ExtraActions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ExtraAction>(
      onSelected: (action) async {
        switch (action) {
          case ExtraAction.feedback:
            final email = Email(
              body: 'Email body',
              subject: 'Email subject',
              recipients: ['example@example.com'],
            );
            await FlutterEmailSender.send(email);
            break;
          case ExtraAction.rateUs:
            final _inAppReview = InAppReview.instance;
            await _inAppReview.openStoreListing(
              appStoreId: '_appStoreId',
              microsoftStoreId: '_microsoftStoreId',
            );
            break;
          case ExtraAction.invite:
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuItem<ExtraAction>>[
        PopupMenuItem<ExtraAction>(
          value: ExtraAction.feedback,
          child: Text(S.of(context).txt_button_feedback),
        ),
        PopupMenuItem<ExtraAction>(
          value: ExtraAction.rateUs,
          child: Text(S.of(context).txt_about_rate),
        ),
        PopupMenuItem<ExtraAction>(
          value: ExtraAction.invite,
          child: Text(S.of(context).txt_about_invite),
        ),
      ],
    );
  }
}

enum ExtraAction { feedback, rateUs, invite }