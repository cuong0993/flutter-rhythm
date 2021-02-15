import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication/authentication_bloc.dart';
import 'authentication/authentication_state.dart';
import 'routes.dart';

class SplashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthenticationBloc>(context).listen((state) {
      if (state is Authenticated) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.home, (route) => false);
      }
    });
    return Scaffold(
        body: Center(
            child: Image(image: AssetImage('assets/images/img_app_icon.png'))));
  }
}
