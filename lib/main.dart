import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication/authentication_bloc.dart';
import 'authentication/authentication_event.dart';
import 'authentication/authentication_state.dart';
import 'game/game_bloc.dart';
import 'game/game_widget.dart';
import 'instrument/instruments_bloc.dart';
import 'instrument/instruments_event.dart';
import 'instrument/instruments_repository_impl.dart';
import 'routes.dart';
import 'simple_bloc_observer.dart';
import 'songs/songs_bloc.dart';
import 'songs/songs_event.dart';
import 'songs/songs_repository_impl.dart';
import 'tab/home_widget.dart';
import 'tab/tab_bloc.dart';
import 'user/user_bloc.dart';
import 'user/user_repository_impl.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('de', 'DE')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: App()));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const isDark = true;
    if (_error) {
      return Scaffold(body: Center(child: Text('Error occurred')));
    }
    if (!_initialized) {
      return Center(child: CircularProgressIndicator());
    }

    final userRepository = UserRepositoryImpl();
    final instrumentsRepository = InstrumentsRepositoryImpl();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc(
              userRepository: userRepository,
            )..add(StartAuthentication());
          },
        ),
        BlocProvider<SongsBloc>(
          create: (context) {
            return SongsBloc(
              songsRepository: SongsRepositoryImpl(),
            )..add(LoadMoreSongs());
          },
        ),
        BlocProvider<InstrumentsBloc>(
          create: (context) {
            return InstrumentsBloc(
              instrumentsRepository: instrumentsRepository,
            )..add(LoadInstruments());
          },
        ),
        BlocProvider<UserBloc>(
          create: (context) {
            return UserBloc(userRepository: userRepository);
          },
        )
      ],
      child: MaterialApp(
        title: 'Hit Notes',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData.from(
            textTheme:
                (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
            colorScheme: ColorScheme(
                brightness: isDark ? Brightness.dark : Brightness.light,
                primary: Color(0xFF1F1929),
                primaryVariant: Color(0xFF1F1929),
                secondary: Color(0xFF1F1929),
                secondaryVariant: Color(0xFF1F1929),
                background: Color(0xFF241E30),
                surface: Color(0xFF241E30),
                onBackground: Color(0xFFFFFFFF),
                onSurface: Color(0xFFFFFFFF),
                onError: Colors.white,
                onPrimary: Colors.white,
                onSecondary: Colors.white,
                error: Colors.red.shade400)),
        routes: {
          Routes.home: (context) {
            return BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                if (state is Authenticated) {
                  return BlocProvider<TabBloc>(
                      create: (context) =>
                          TabBloc(userRepository, instrumentsRepository),
                      child: HomeWidget());
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
