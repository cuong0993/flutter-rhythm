import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:in_app_review/in_app_review.dart';

import '../generated/l10n.dart';
import '../loading_widget.dart';
import 'user_bloc.dart';

class UserWidget extends StatelessWidget {
  UserWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInitial) {
          BlocProvider.of<UserBloc>(context).add(LoadUser());
          return LoadingWidget();
        } else if (state is UserUpdated) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: AssetImage('assets/images/img_firework.png')),
                      Text(
                        S.of(context).txt_dialog_level_up_description('1'),
                        style: Theme.of(context).textTheme.headline6,
                      )
                    ],
                  ),
                ),
              ),
              MaterialButton(
                  onPressed: () async {
                    final email = Email(
                      body: 'Email body',
                      subject: 'Email subject',
                      recipients: ['example@example.com'],
                    );
                    await FlutterEmailSender.send(email);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Icon(
                        Icons.email_rounded,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        S.of(context).txt_button_feedback,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  textColor: Colors.white),
              MaterialButton(
                  onPressed: () {
                    final _inAppReview = InAppReview.instance;
                    _inAppReview.openStoreListing(
                      appStoreId: '_appStoreId',
                      microsoftStoreId: '_microsoftStoreId',
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        S.of(context).txt_about_rate,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  textColor: Colors.white),
              MaterialButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Icon(
                        Icons.insert_invitation_rounded,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        S.of(context).txt_about_invite,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  textColor: Colors.white),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
