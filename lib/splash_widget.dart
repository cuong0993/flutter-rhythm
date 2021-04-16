import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'authentication/authentication_model.dart';
import 'authentication/authentication_state.dart';
import 'instrument/instruments_model.dart';
import 'main.dart';
import 'routes.dart';
import 'songs/songs_model.dart';

class SplashWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    context.read(authenticationProvider.notifier).signInAnonymously();
    return ProviderListener(
        provider: authenticationProvider,
        onChange: (context, state) {
          if (state is Authenticated) {
            context
                .read(songsStateProvider.notifier)
                .loadMoreSongsByTagNumbers(songTags.asMap().keys.toList());
            context.read(instrumentsStateProvider.notifier).loadInstruments();
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
