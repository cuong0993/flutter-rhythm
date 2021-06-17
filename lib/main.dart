import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'locale/locale_model.dart';
import 'preferences.dart';
import 'router/router.dart';
import 'theme/theme_model.dart';

class LogProviderObserver extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? newValue) {
    Logger.root.info('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  if (kReleaseMode) {
    Logger.root.level = Level.OFF;
  }
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  runApp(
    ProviderScope(
      observers: [LogProviderObserver()],
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: App(),
    ),
  );
}

class App extends HookWidget {
  App({Key? key}) : super(key: key);

  final _rootRouter = RootRouter();

  @override
  Widget build(BuildContext context) {
    final themeMode = useProvider(themeModeProvider);
    final locale = useProvider(localeProvider);
    return MaterialApp.router(
      title: 'Hit Notes',
      debugShowCheckedModeBanner: false,
      locale: locale,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      themeMode: themeMode,
      theme: buildTheme(),
      darkTheme: buildTheme(isDark: true),
      routerDelegate: AutoRouterDelegate(
        _rootRouter,
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      routeInformationParser: _rootRouter.defaultRouteParser(),
    );
  }
}
