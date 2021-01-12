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
import 'routes.dart';
import 'setting/locale_widget.dart';
import 'setting/setting_bloc.dart';
import 'setting/theme_widget.dart';
import 'simple_bloc_observer.dart';
import 'songs/songs_bloc.dart';
import 'songs/songs_event.dart';
import 'songs/songs_repository.dart';
import 'songs/songs_repository_impl.dart';
import 'splash_widget.dart';
import 'theme/theme_widget.dart';
import 'user/user_bloc.dart';
import 'user/user_repository_impl.dart';
import 'user/user_widget.dart';

const songTags = [
  'pop',
  'classic',
  'folk',
  'kpop',
  'other',
];

Color primaryColor;
Color secondaryColor;
Color backgroundColor;
Color onBackgroundColor;
Paint paint;

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
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<SongsRepository>(
              create: (context) => songsRepository),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<SettingBloc>(
              create: (context) {
                return SettingBloc();
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
          BlocBuilder<SettingBloc, SettingState>(builder: (context, state) {
            return MaterialApp(
              title: 'Hit Notes',
              debugShowCheckedModeBanner: false,
              locale: state.locale,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              themeMode: state.themeMode,
              theme: buildTheme(false),
              darkTheme: buildTheme(true),
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
                  primaryColor = Theme.of(context).colorScheme.primary;
                  secondaryColor = Theme.of(context).colorScheme.secondary;
                  backgroundColor = Theme.of(context).colorScheme.background;
                  onBackgroundColor =
                      Theme.of(context).colorScheme.onBackground;
                  paint = Paint()
                    ..colorFilter =
                        ColorFilter.mode(primaryColor, BlendMode.srcIn);
                  return BlocProvider<GameConfigBloc>(
                      create: (context) => GameConfigBloc(),
                      child: GameConfigWidget());
                },
                Routes.game: (context) {
                  return BlocProvider<GameBloc>(
                      create: (_) => GameBloc(), child: GameWidget());
                },
                Routes.account: (context) {
                  return UserWidget();
                },
                Routes.language: (context) {
                  return LocaleWidget();
                },
                Routes.theme: (context) {
                  return ThemeWidget();
                },
                Routes.instrument: (context) {
                  return InstrumentsWidget();
                },
              },
            );
          }),
        ));
  }

  ThemeData buildTheme(bool isDark) {
    final primaryColor = Color(0xff4760e9);
    final onPrimaryColor = Colors.white;
    final secondaryColor = Color(0xfffd7c6e);
    final backgroundColor = isDark ? Colors.black : Colors.white;
    final onBackgroundColor = isDark ? Colors.white : Colors.black;
    final screenHeadingTextStyle =
        TextStyle(fontSize: 32.0, color: secondaryColor);
    final screenTaskNameTextStyle =
        TextStyle(fontSize: 20.0, color: onBackgroundColor);
    final screenTaskDurationTextStyle =
        TextStyle(fontSize: 16.0, color: onBackgroundColor);
    final textTheme = TextTheme(
      headline5: screenHeadingTextStyle,
      bodyText2: screenTaskNameTextStyle,
      bodyText1: screenTaskDurationTextStyle,
    );
    return ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: primaryColor, onPrimary: onPrimaryColor)),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              primary: onBackgroundColor, onSurface: onBackgroundColor)),
      scaffoldBackgroundColor: backgroundColor,
      tabBarTheme: TabBarTheme(
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: primaryColor,
                width: 2,
              ),
            ),
          ),
          labelStyle: screenTaskNameTextStyle,
          labelColor: primaryColor,
          unselectedLabelColor: onBackgroundColor),
      appBarTheme: AppBarTheme(
        textTheme: textTheme,
        color: backgroundColor,
        iconTheme: IconThemeData(color: primaryColor),
      ),
      popupMenuTheme: PopupMenuThemeData(color: backgroundColor),
      colorScheme: ColorScheme(
        primary: primaryColor,
        primaryVariant: primaryColor,
        secondary: secondaryColor,
        onPrimary: onPrimaryColor,
        onError: onBackgroundColor,
        error: backgroundColor,
        onBackground: onBackgroundColor,
        secondaryVariant: secondaryColor,
        background: backgroundColor,
        onSurface: onBackgroundColor,
        onSecondary: secondaryColor,
        brightness: isDark? Brightness.dark : Brightness.light,
        surface: backgroundColor,
      ),
      toggleableActiveColor: primaryColor,
      iconTheme: IconThemeData(
        color: primaryColor,
      ),
      textTheme: textTheme,
    );
  }
}
