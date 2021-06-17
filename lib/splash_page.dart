import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'authentication/authentication_model.dart';
import 'authentication/authentication_state.dart';
import 'router/router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
        provider: authenticationProvider,
        onChange: (context, state) {
          if (state is AuthenticationStateAuthenticated) {
            AutoRouter.of(context).replace(const HomeRoute());
          }
        },
        child: const Scaffold(
            body: Center(
                child: Image(
                    image: AssetImage('assets/images/img_app_icon.png')))));
  }
}
