// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../game/game_page.dart' as _i4;
import '../game_config/game_config_page.dart' as _i3;
import '../home/home_page.dart' as _i2;
import '../instrument/instruments_page.dart' as _i8;
import '../locale/locale_page.dart' as _i6;
import '../setting/settings_page.dart' as _i9;
import '../songs/song.dart' as _i12;
import '../splash_page.dart' as _i1;
import '../theme/theme_page.dart' as _i7;
import '../user/user_page.dart' as _i5;

class RootRouter extends _i10.RootStackRouter {
  RootRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    HomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    GameConfigRoute.name: (routeData) {
      final args = routeData.argsAs<GameConfigRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.GameConfigPage(song: args.song, key: args.key));
    },
    GameRoute.name: (routeData) {
      final args = routeData.argsAs<GameRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.GamePage(arguments: args.arguments, key: args.key));
    },
    UserRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.UserPage());
    },
    LocaleRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.LocalePage());
    },
    ThemeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ThemePage());
    },
    InstrumentsRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.InstrumentsPage());
    },
    SettingsRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.SettingsPage());
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(SplashRoute.name, path: '/'),
        _i10.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i10.RouteConfig(GameConfigRoute.name, path: '/game-config-page'),
        _i10.RouteConfig(GameRoute.name, path: '/game-page'),
        _i10.RouteConfig(UserRoute.name, path: '/user-page'),
        _i10.RouteConfig(LocaleRoute.name, path: '/locale-page'),
        _i10.RouteConfig(ThemeRoute.name, path: '/theme-page'),
        _i10.RouteConfig(InstrumentsRoute.name, path: '/instruments-page'),
        _i10.RouteConfig(SettingsRoute.name, path: '/settings-page')
      ];
}

/// generated route for [_i1.SplashPage]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for [_i2.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for [_i3.GameConfigPage]
class GameConfigRoute extends _i10.PageRouteInfo<GameConfigRouteArgs> {
  GameConfigRoute({required _i12.Song song, _i11.Key? key})
      : super(name,
            path: '/game-config-page',
            args: GameConfigRouteArgs(song: song, key: key));

  static const String name = 'GameConfigRoute';
}

class GameConfigRouteArgs {
  const GameConfigRouteArgs({required this.song, this.key});

  final _i12.Song song;

  final _i11.Key? key;
}

/// generated route for [_i4.GamePage]
class GameRoute extends _i10.PageRouteInfo<GameRouteArgs> {
  GameRoute({required Map<String, dynamic> arguments, _i11.Key? key})
      : super(name,
            path: '/game-page',
            args: GameRouteArgs(arguments: arguments, key: key));

  static const String name = 'GameRoute';
}

class GameRouteArgs {
  const GameRouteArgs({required this.arguments, this.key});

  final Map<String, dynamic> arguments;

  final _i11.Key? key;
}

/// generated route for [_i5.UserPage]
class UserRoute extends _i10.PageRouteInfo<void> {
  const UserRoute() : super(name, path: '/user-page');

  static const String name = 'UserRoute';
}

/// generated route for [_i6.LocalePage]
class LocaleRoute extends _i10.PageRouteInfo<void> {
  const LocaleRoute() : super(name, path: '/locale-page');

  static const String name = 'LocaleRoute';
}

/// generated route for [_i7.ThemePage]
class ThemeRoute extends _i10.PageRouteInfo<void> {
  const ThemeRoute() : super(name, path: '/theme-page');

  static const String name = 'ThemeRoute';
}

/// generated route for [_i8.InstrumentsPage]
class InstrumentsRoute extends _i10.PageRouteInfo<void> {
  const InstrumentsRoute() : super(name, path: '/instruments-page');

  static const String name = 'InstrumentsRoute';
}

/// generated route for [_i9.SettingsPage]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute() : super(name, path: '/settings-page');

  static const String name = 'SettingsRoute';
}
