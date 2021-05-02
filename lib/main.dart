import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'game/colors.dart';
import 'game/game_widget.dart';
import 'game_config/game_config_page.dart';
import 'home/home_page.dart';
import 'instrument/instruments_page.dart';
import 'locale/locale_model.dart';
import 'locale/locale_page.dart';
import 'preferences.dart';
import 'routes.dart';
import 'setting/settings_page.dart';
import 'splash_page.dart';
import 'theme/theme_model.dart';
import 'theme/theme_page.dart';
import 'user/user_page.dart';

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
          return SplashPage();
        },
        Routes.home: (context) {
          return HomePage();
        },
        Routes.gameConfig: (context) {
          return GameConfigPage();
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
          return UserPage();
        },
        Routes.language: (context) {
          return LocalePage();
        },
        Routes.theme: (context) {
          return ThemePage();
        },
        Routes.instrument: (context) {
          return InstrumentsPage();
        },
        Routes.setting: (context) {
          return SettingsPage();
        },
      },
    );
  }
}
