import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'locale/locale_controller.dart';
import 'router/router.dart';
import 'theme/theme_controller.dart';

class App extends ConsumerWidget {
  App({Key? key}) : super(key: key);

  final _rootRouter = RootRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final locale = ref.watch(localeProvider);
    return MaterialApp.router(
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
