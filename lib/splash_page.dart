import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'authentication/authentication_controller.dart';
import 'authentication/authentication_state.dart';
import 'router/router.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authenticationProvider, (state) {
      if (state is AuthenticationStateAuthenticated ||
          state is AuthenticationStateUnauthenticated) {
        AutoRouter.of(context).replace(const HomeRoute());
      }
    });
    return const Scaffold(
        body: Center(
            child: Image(image: AssetImage('assets/images/img_app_icon.png'))));
  }
}
