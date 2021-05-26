import 'package:auto_route/auto_route.dart';

import '../game/game_page.dart';
import '../game_config/game_config_page.dart';
import '../home/home_page.dart';
import '../instrument/instruments_page.dart';
import '../locale/locale_page.dart';
import '../setting/settings_page.dart';
import '../splash_page.dart';
import '../theme/theme_page.dart';
import '../user/user_page.dart';

export 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // app stack
    AutoRoute<dynamic>(
      path: '/',
      page: SplashPage,
    ),
    AutoRoute<dynamic>(
      path: '/home',
      page: HomePage,
    ),
    AutoRoute<dynamic>(
      path: '/gameConfig',
      page: GameConfigPage,
    ),
    AutoRoute<dynamic>(
      path: '/game',
      page: GamePage,
    ),
    AutoRoute<dynamic>(
      path: '/user',
      page: UserPage,
    ),
    AutoRoute<dynamic>(
      path: '/locale',
      page: LocalePage,
    ),
    AutoRoute<dynamic>(
      path: '/theme',
      page: ThemePage,
    ),
    AutoRoute<dynamic>(
      path: '/instrument',
      page: InstrumentsPage,
    ),
    AutoRoute<dynamic>(
      path: '/setting',
      page: SettingsPage,
    ),
  ],
)
class $RootRouter {}
