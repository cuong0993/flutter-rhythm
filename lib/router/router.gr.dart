// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../game/game_page.dart' as _i6;
import '../game_config/game_config_page.dart' as _i5;
import '../home/home_page.dart' as _i4;
import '../instrument/instruments_page.dart' as _i10;
import '../locale/locale_page.dart' as _i8;
import '../setting/settings_page.dart' as _i11;
import '../songs/song.dart' as _i12;
import '../splash_page.dart' as _i3;
import '../theme/theme_page.dart' as _i9;
import '../user/user_page.dart' as _i7;

class RootRouter extends _i1.RootStackRouter {
  RootRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.SplashPage();
        }),
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.HomePage();
        }),
    GameConfigRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<GameConfigRouteArgs>();
          return _i5.GameConfigPage(song: args.song);
        }),
    GameRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<GameRouteArgs>();
          return _i6.GamePage(key: args.key, arguments: args.arguments);
        }),
    UserRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i7.UserPage();
        }),
    LocaleRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.LocalePage();
        }),
    ThemeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i9.ThemePage();
        }),
    InstrumentsRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i10.InstrumentsPage();
        }),
    SettingsRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i11.SettingsPage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashRoute.name, path: '/'),
        _i1.RouteConfig(HomeRoute.name, path: '/home'),
        _i1.RouteConfig(GameConfigRoute.name, path: '/gameConfig'),
        _i1.RouteConfig(GameRoute.name, path: '/game'),
        _i1.RouteConfig(UserRoute.name, path: '/user'),
        _i1.RouteConfig(LocaleRoute.name, path: '/locale'),
        _i1.RouteConfig(ThemeRoute.name, path: '/theme'),
        _i1.RouteConfig(InstrumentsRoute.name, path: '/instrument'),
        _i1.RouteConfig(SettingsRoute.name, path: '/setting')
      ];
}

class SplashRoute extends _i1.PageRouteInfo {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/home');

  static const String name = 'HomeRoute';
}

class GameConfigRoute extends _i1.PageRouteInfo<GameConfigRouteArgs> {
  GameConfigRoute({required _i12.Song song})
      : super(name, path: '/gameConfig', args: GameConfigRouteArgs(song: song));

  static const String name = 'GameConfigRoute';
}

class GameConfigRouteArgs {
  const GameConfigRouteArgs({required this.song});

  final _i12.Song song;
}

class GameRoute extends _i1.PageRouteInfo<GameRouteArgs> {
  GameRoute({_i2.Key? key, required Map<String, dynamic> arguments})
      : super(name,
            path: '/game', args: GameRouteArgs(key: key, arguments: arguments));

  static const String name = 'GameRoute';
}

class GameRouteArgs {
  const GameRouteArgs({this.key, required this.arguments});

  final _i2.Key? key;

  final Map<String, dynamic> arguments;
}

class UserRoute extends _i1.PageRouteInfo {
  const UserRoute() : super(name, path: '/user');

  static const String name = 'UserRoute';
}

class LocaleRoute extends _i1.PageRouteInfo {
  const LocaleRoute() : super(name, path: '/locale');

  static const String name = 'LocaleRoute';
}

class ThemeRoute extends _i1.PageRouteInfo {
  const ThemeRoute() : super(name, path: '/theme');

  static const String name = 'ThemeRoute';
}

class InstrumentsRoute extends _i1.PageRouteInfo {
  const InstrumentsRoute() : super(name, path: '/instrument');

  static const String name = 'InstrumentsRoute';
}

class SettingsRoute extends _i1.PageRouteInfo {
  const SettingsRoute() : super(name, path: '/setting');

  static const String name = 'SettingsRoute';
}