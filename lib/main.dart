import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'game/colors.dart';
import 'game/game_widget.dart';
import 'game_config/game_config_widget.dart';
import 'home/home_widget.dart';
import 'instrument/instruments_widget.dart';
import 'locale/locale_model.dart';
import 'locale/locale_widget.dart';
import 'preferences.dart';
import 'routes.dart';
import 'setting/settings_widget.dart';
import 'splash_widget.dart';
import 'theme/theme_model.dart';
import 'theme/theme_widget.dart';
import 'user/user_widget.dart';

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
      theme: buildTheme(),
      darkTheme: buildTheme(isDark: true),
      routes: {
        Routes.splash: (context) {
          return SplashWidget();
        },
        Routes.home: (context) {
          return HomeWidget();
        },
        Routes.gameConfig: (context) {
          return GameConfigWidget();
        },
        Routes.game: (context) {
          primaryColor = Theme.of(context).colorScheme.primary;
          secondaryColor = Theme.of(context).colorScheme.secondary;
          backgroundColor = Theme.of(context).colorScheme.background;
          onBackgroundColor = Theme.of(context).colorScheme.onBackground;
          paint = Paint()
            ..colorFilter = ColorFilter.mode(primaryColor, BlendMode.srcIn);
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
}
