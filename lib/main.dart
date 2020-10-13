import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitnotes/routes.dart';

import 'authentication/authentication_bloc.dart';
import 'authentication/authentication_event.dart';
import 'authentication/authentication_state.dart';
import 'game/game_bloc.dart';
import 'game/game_widget.dart';
import 'simple_bloc_observer.dart';
import 'songs/firebase_songs_repository.dart';
import 'songs/songs_bloc.dart';
import 'songs/songs_event.dart';
import 'tab/home_widget.dart';
import 'tab/tab_bloc.dart';
import 'user/firebase_user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc(
              userRepository: FirebaseUserRepository(),
            )..add(StartAuthentication());
          },
        ),
        BlocProvider<SongsBloc>(
          create: (context) {
            return SongsBloc(
              songsRepository: FirebaseSongsRepository(),
            )..add(LoadSongs());
          },
        )
      ],
      child: MaterialApp(
        title: 'Hit Notes',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.indigo,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          Routes.home: (context) {
            return BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                if (state is Authenticated) {
                  return BlocProvider<TabBloc>(
                      create: (context) => TabBloc(), child: HomeWidget());
                }
                if (state is Unauthenticated) {
                  return Scaffold(body: Center(child: Text('Error occurred')));
                }
                return Center(child: CircularProgressIndicator());
              },
            );
          },
          Routes.game: (context) {
            return BlocProvider<GameBloc>(
                create: (_) => GameBloc(), child: GameWidget());
          },
        },
      ),
    );
  }
}
