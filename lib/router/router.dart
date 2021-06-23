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
      page: HomePage,
    ),
    AutoRoute<dynamic>(
      page: GameConfigPage,
    ),
    AutoRoute<dynamic>(
      page: GamePage,
    ),
    AutoRoute<dynamic>(
      page: UserPage,
    ),
    AutoRoute<dynamic>(
      page: LocalePage,
    ),
    AutoRoute<dynamic>(
      page: ThemePage,
    ),
    AutoRoute<dynamic>(
      page: InstrumentsPage,
    ),
    AutoRoute<dynamic>(
      page: SettingsPage,
    ),
  ],
)
class $RootRouter {}
