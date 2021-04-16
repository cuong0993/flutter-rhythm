import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'game/game_widget.dart';
import 'game_config/game_config_widget.dart';
import 'home/home_widget.dart';
import 'instrument/instruments_widget.dart';
import 'preferences.dart';
import 'routes.dart';
import 'setting/locale.dart';
import 'setting/locale_widget.dart';
import 'setting/settings_widget.dart';
import 'setting/theme.dart';
import 'setting/theme_widget.dart';
import 'splash_widget.dart';
import 'user/user_widget.dart';

const songTags = [
  'pop',
  'classic',
  'folk',
  'kpop',
  'other',
];

String getSongTagName(BuildContext context, String tabName) {
  switch (tabName) {
    case 'pop':
      return AppLocalizations.of(context)!.pop;
    case 'classic':
      return AppLocalizations.of(context)!.classic;
    case 'folk':
      return AppLocalizations.of(context)!.folk;
    case 'kpop':
      return AppLocalizations.of(context)!.kpop;
    case 'other':
      return AppLocalizations.of(context)!.other;
    default:
      return '';
  }
}

String getInstrumentName(BuildContext context, String instrumentId) {
  switch (instrumentId) {
    case 'piano':
      return AppLocalizations.of(context)!.piano;
    case 'acoustic_guitar':
      return AppLocalizations.of(context)!.acoustic_guitar;
    case 'electric_guitar':
      return AppLocalizations.of(context)!.electric_guitar;
    default:
      return '';
  }
}

String getThemeName(BuildContext context, ThemeMode themeMode) {
  switch (themeMode) {
    case ThemeMode.dark:
      return AppLocalizations.of(context)!.dark;
    case ThemeMode.light:
      return AppLocalizations.of(context)!.light;
    case ThemeMode.system:
      return AppLocalizations.of(context)!.system;
    default:
      return '';
  }
}

late Color primaryColor;
late Color secondaryColor;
late Color backgroundColor;
late Color onBackgroundColor;
late Paint paint;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: App(),
    ),
  );
}

class App extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final themeMode = watch(themeModeProvider);
    final locale = watch(localeProvider);
    return MaterialApp(
      title: 'Hit Notes',
      debugShowCheckedModeBanner: false,
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: themeMode,
      theme: buildDarkTheme(false),
      darkTheme: buildDarkTheme(true),
      routes: {
        Routes.splash: (context) {
          return SplashWidget();
        },
        Routes.home: (context) {
          return HomeWidget();
        },
        Routes.gameConfig: (context) {
          primaryColor = Theme.of(context).colorScheme.primary;
          secondaryColor = Theme.of(context).colorScheme.secondary;
          backgroundColor = Theme.of(context).colorScheme.background;
          onBackgroundColor = Theme.of(context).colorScheme.onBackground;
          paint = Paint()
            ..colorFilter = ColorFilter.mode(primaryColor, BlendMode.srcIn);
          return GameConfigWidget();
        },
        Routes.game: (context) {
          return GameWidget();
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
        Routes.setting: (context) {
          return SettingsWidget();
        },
      },
    );
  }

  ThemeData buildDarkTheme(bool isDark) {
    final primaryColor = const Color(0xff4760e9);
    final onPrimaryColor = Colors.white;
    final secondaryColor = const Color(0xfffd7c6e);
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
        brightness: isDark ? Brightness.dark : Brightness.light,
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
