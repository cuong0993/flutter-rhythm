import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'authentication/authentication_bloc.dart';
import 'game/game_bloc.dart';
import 'game/game_widget.dart';
import 'game_config/game_config_bloc.dart';
import 'game_config/game_config_widget.dart';
import 'generated/l10n.dart';
import 'home/home_bloc.dart';
import 'home/home_widget.dart';
import 'instrument/instruments_repository_impl.dart';
import 'instrument/instruments_widget.dart';
import 'locale/locale_bloc.dart';
import 'locale/locale_widget.dart';
import 'routes.dart';
import 'simple_bloc_observer.dart';
import 'songs/songs_bloc.dart';
import 'songs/songs_event.dart';
import 'songs/songs_repository.dart';
import 'songs/songs_repository_impl.dart';
import 'splash_widget.dart';
import 'user/user_bloc.dart';
import 'user/user_repository_impl.dart';
import 'user/user_widget.dart';

const songTags = [
  'pop',
  'classic',
  'folk',
  'kpop',
];

void main() async {
  Bloc.observer = SimpleBlocObserver();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userRepository = UserRepositoryImpl();
    final instrumentsRepository = InstrumentsRepositoryImpl();
    final songsRepository = SongsRepositoryImpl();
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<SongsRepository>(
              create: (context) => songsRepository),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<LocaleBloc>(
              create: (context) {
                return LocaleBloc();
              },
            ),
            BlocProvider<AuthenticationBloc>(
              create: (context) {
                return AuthenticationBloc(userRepository);
              },
            ),
            BlocProvider<SongsBloc>(
              create: (context) {
                return SongsBloc(
                  songsRepository: songsRepository,
                )..add(
                    LoadMoreSongsByTagNumbers(songTags.asMap().keys.toList()));
              },
            ),
            BlocProvider<UserBloc>(
              create: (context) {
                return UserBloc(instrumentsRepository,
                    userRepository: userRepository);
              },
            )
          ],
          child:
              BlocBuilder<LocaleBloc, LocaleState>(builder: (context, state) {
            return MaterialApp(
              title: 'Hit Notes',
              debugShowCheckedModeBanner: false,
              locale: (state is LocaleChanged) ? state.locale : null,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              /* Peaceful color scheme #5FAAE3 #BAEBFA #FEF3D8 #F2B5AF #939BCB #13436B */
              theme: ThemeData.from(
                colorScheme: ColorScheme(
                  primary: Color(0xff1cdec9),
                  primaryVariant: Color(0xff00ab98),
                  secondary: Color(0xffff8383),
                  secondaryVariant: Color(0xffc85356),
                  surface: Color(0xff1f1929),
                  background: Color(0xff1f1929),
                  error: Color(0xff92222d),
                  onPrimary: Colors.black,
                  onSecondary: Colors.black,
                  onSurface: Colors.white,
                  onBackground: Colors.white,
                  onError: Colors.white,
                  brightness: Brightness.dark,
                ),
              ),
              routes: {
                Routes.splash: (context) {
                  return SplashWidget();
                },
                Routes.home: (context) {
                  return BlocProvider<HomeBloc>(
                      create: (context) =>
                          HomeBloc(userRepository, instrumentsRepository),
                      child: HomeWidget());
                },
                Routes.gameConfig: (context) {
                  return BlocProvider<GameConfigBloc>(
                      create: (context) => GameConfigBloc(),
                      child: GameConfigWidget());
                },
                Routes.game: (context) {
                  SystemChrome.setEnabledSystemUIOverlays([]);
                  return BlocProvider<GameBloc>(
                      create: (_) => GameBloc(), child: GameWidget());
                },
                Routes.account: (context) {
                  return UserWidget();
                },
                Routes.language: (context) {
                  return LocaleWidget();
                },
                Routes.instrument: (context) {
                  return InstrumentsWidget();
                },
              },
            );
          }),
        ));
  }
}
