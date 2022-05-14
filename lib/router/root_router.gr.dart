// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:hitnotes/game/game_page.dart' as _i7;
import 'package:hitnotes/game_config/game_config_page.dart' as _i1;
import 'package:hitnotes/home/home_page.dart' as _i2;
import 'package:hitnotes/instrument/instruments_page.dart' as _i4;
import 'package:hitnotes/locale/locale_page.dart' as _i3;
import 'package:hitnotes/setting/settings_page.dart' as _i9;
import 'package:hitnotes/songs/song.dart' as _i12;
import 'package:hitnotes/splash_page.dart' as _i5;
import 'package:hitnotes/theme/theme_page.dart' as _i8;
import 'package:hitnotes/user/user_page.dart' as _i6;

abstract class $RootRouter extends _i10.RootStackRouter {
  $RootRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    GameConfigRoute.name: (routeData) {
      final args = routeData.argsAs<GameConfigRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.GameConfigPage(
          song: args.song,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    LocaleRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LocalePage(),
      );
    },
    InstrumentsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.InstrumentsPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashPage(),
      );
    },
    UserRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.UserPage(),
      );
    },
    GameRoute.name: (routeData) {
      final args = routeData.argsAs<GameRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.GamePage(
          arguments: args.arguments,
          key: args.key,
        ),
      );
    },
    ThemeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ThemePage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SettingsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.GameConfigPage]
class GameConfigRoute extends _i10.PageRouteInfo<GameConfigRouteArgs> {
  GameConfigRoute({
    required _i12.Song song,
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          GameConfigRoute.name,
          args: GameConfigRouteArgs(
            song: song,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'GameConfigRoute';

  static const _i10.PageInfo<GameConfigRouteArgs> page =
      _i10.PageInfo<GameConfigRouteArgs>(name);
}

class GameConfigRouteArgs {
  const GameConfigRouteArgs({
    required this.song,
    this.key,
  });

  final _i12.Song song;

  final _i11.Key? key;

  @override
  String toString() {
    return 'GameConfigRouteArgs{song: $song, key: $key}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LocalePage]
class LocaleRoute extends _i10.PageRouteInfo<void> {
  const LocaleRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LocaleRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocaleRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.InstrumentsPage]
class InstrumentsRoute extends _i10.PageRouteInfo<void> {
  const InstrumentsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          InstrumentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'InstrumentsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashPage]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.UserPage]
class UserRoute extends _i10.PageRouteInfo<void> {
  const UserRoute({List<_i10.PageRouteInfo>? children})
      : super(
          UserRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.GamePage]
class GameRoute extends _i10.PageRouteInfo<GameRouteArgs> {
  GameRoute({
    required Map<String, dynamic> arguments,
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          GameRoute.name,
          args: GameRouteArgs(
            arguments: arguments,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'GameRoute';

  static const _i10.PageInfo<GameRouteArgs> page =
      _i10.PageInfo<GameRouteArgs>(name);
}

class GameRouteArgs {
  const GameRouteArgs({
    required this.arguments,
    this.key,
  });

  final Map<String, dynamic> arguments;

  final _i11.Key? key;

  @override
  String toString() {
    return 'GameRouteArgs{arguments: $arguments, key: $key}';
  }
}

/// generated route for
/// [_i8.ThemePage]
class ThemeRoute extends _i10.PageRouteInfo<void> {
  const ThemeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ThemeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ThemeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SettingsPage]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
