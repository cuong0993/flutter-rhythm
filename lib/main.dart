import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitnotes/blocs/songs/songs_event.dart';
import 'package:hitnotes/repositories/firebase_songs_repository.dart';
import 'package:hitnotes/screens/details_screen.dart';
import 'package:hitnotes/screens/home_screen.dart';

import 'blocs/authentication_bloc/bloc.dart';
import 'blocs/blocs.dart';
import 'blocs/filtered_songs/filtered_songs_bloc.dart';
import 'blocs/simple_bloc_observer.dart';
import 'blocs/songs/songs_bloc.dart';
import 'blocs/tab/tab_bloc.dart';
import 'repositories/firebase_user_repository.dart';

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
            )..add(AppStarted());
          },
        ),
        BlocProvider<SongsBloc>(
          create: (context) {
            return SongsBloc(
              songsRepository: FirebaseSongRepository(),
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
          '/': (context) {
            return BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                if (state is Authenticated) {
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider<TabBloc>(
                        create: (context) => TabBloc(),
                      ),
                      BlocProvider<FilteredSongsBloc>(
                        create: (context) => FilteredSongsBloc(
                          songsBloc: BlocProvider.of<SongsBloc>(context),
                        ),
                      ),
                    ],
                    child: HomeScreen(),
                  );
                }
                if (state is Unauthenticated) {
                  return Center(
                    child: Text('Could not authenticate with Firestore'),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            );
          },
          '/addSong': (context) {
            return GameScreen();
          },
        },
      ),
    );
  }
}
