import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'authentication_model.dart';

class AuthenticationWidget extends StatelessWidget {
  const AuthenticationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  OutlinedButton(
                    onPressed: () {
                      context
                          .read(authenticationProvider.notifier)
                          .signInWithGoogle();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Image(
                              image:
                                  AssetImage('assets/images/img_google.png')),
                          const SizedBox(width: 8),
                          Text(
                              AppLocalizations.of(context)!
                                  .txt_button_sign_in_google,
                              style: Theme.of(context).textTheme.subtitle1)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton(
                    onPressed: () {
                      context
                          .read(authenticationProvider.notifier)
                          .signInWithFacebook();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Image(
                              image:
                                  AssetImage('assets/images/img_facebook.png')),
                          const SizedBox(width: 8),
                          Text(
                              AppLocalizations.of(context)!
                                  .txt_button_sign_in_facebook,
                              style: Theme.of(context).textTheme.subtitle1)
                        ],
                      ),
                    ),
                  ),
                ])));
  }
}
