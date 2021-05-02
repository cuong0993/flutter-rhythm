import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'authentication/authentication_model.dart';
import 'authentication/authentication_state.dart';
import 'routes.dart';

class SplashPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return ProviderListener(
        provider: authenticationProvider,
        onChange: (context, state) {
          if (state is Authenticated) {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.home, (route) => false);
          }
        },
        child: const Scaffold(
            body: Center(
                child: Image(
                    image: AssetImage('assets/images/img_app_icon.png')))));
  }
}
