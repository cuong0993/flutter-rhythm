import 'package:auto_route/auto_route.dart';

import 'root_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class RootRouter extends $RootRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/', page: SplashRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: GameConfigRoute.page),
    AutoRoute(page: GameRoute.page),
    AutoRoute(page: UserRoute.page),
    AutoRoute(page: LocaleRoute.page),
    AutoRoute(page: ThemeRoute.page),
    AutoRoute(page: InstrumentsRoute.page),
    AutoRoute(page: SettingsRoute.page),
  ];
}
