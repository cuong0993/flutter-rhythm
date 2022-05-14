import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'authentication_controller.dart';

class AuthenticationWidget extends ConsumerWidget {
  const AuthenticationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => Card(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              OutlinedButton(
                onPressed: () {
                  ref.watch(authenticationProvider.notifier).signInWithGoogle();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: <Widget>[
                      const Image(
                        image: AssetImage('assets/images/img_google.png'),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        L10n.of(context)!.txt_button_sign_in_google,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {
                  ref
                      .watch(authenticationProvider.notifier)
                      .signInWithFacebook();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: <Widget>[
                      const Image(
                        image: AssetImage('assets/images/img_facebook.png'),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        L10n.of(context)!.txt_button_sign_in_facebook,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
