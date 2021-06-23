import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../preferences.dart';

final themeModeProvider =
    StateNotifierProvider<ThemeController, ThemeMode>((ref) {
  final themeName = ref.read(sharedUtilityProvider).getThemeName();
  final themeMode = ThemeMode.values.firstWhere(
      (element) => element.toString() == themeName,
      orElse: () => ThemeMode.system);
  return ThemeController(ref.read, themeMode);
});

class ThemeController extends StateNotifier<ThemeMode> {
  ThemeController(this._read, ThemeMode defaultThemeMode)
      : super(defaultThemeMode);
  final Reader _read;

  Future setThemeMode(BuildContext context, ThemeMode themeMode) async {
    await _read(sharedUtilityProvider).setThemeName(themeMode.toString());
    state = themeMode;
  }
}

ThemeData buildTheme({bool isDark = false}) {
  const primaryColor = Color(0xff4760e9);
  final onPrimaryColor = Colors.white;
  const secondaryColor = Color(0xfffd7c6e);
  final backgroundColor = isDark ? Colors.black : Colors.white;
  final onBackgroundColor = isDark ? Colors.white : Colors.black;
  const screenHeadingTextStyle =
      TextStyle(fontSize: 32.0, color: secondaryColor);
  final screenTaskNameTextStyle =
      TextStyle(fontSize: 20.0, color: onBackgroundColor);
  final screenTaskDurationTextStyle =
      TextStyle(fontSize: 16.0, color: onBackgroundColor);
  final textTheme = TextTheme(
    headline5: screenHeadingTextStyle,
    bodyText2: screenTaskNameTextStyle,
    bodyText1: screenTaskDurationTextStyle,
  );
  return ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: primaryColor, onPrimary: onPrimaryColor)),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            primary: onBackgroundColor, onSurface: onBackgroundColor)),
    scaffoldBackgroundColor: backgroundColor,
    tabBarTheme: TabBarTheme(
        indicator: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: primaryColor,
              width: 2,
            ),
          ),
        ),
        labelStyle: screenTaskNameTextStyle,
        labelColor: primaryColor,
        unselectedLabelColor: onBackgroundColor),
    appBarTheme: AppBarTheme(
      textTheme: textTheme,
      color: backgroundColor,
      iconTheme: const IconThemeData(color: primaryColor),
    ),
    popupMenuTheme: PopupMenuThemeData(color: backgroundColor),
    colorScheme: ColorScheme(
      primary: primaryColor,
      primaryVariant: primaryColor,
      secondary: secondaryColor,
      onPrimary: onPrimaryColor,
      onError: onBackgroundColor,
      error: backgroundColor,
      onBackground: onBackgroundColor,
      secondaryVariant: secondaryColor,
      background: backgroundColor,
      onSurface: onBackgroundColor,
      onSecondary: secondaryColor,
      brightness: isDark ? Brightness.dark : Brightness.light,
      surface: backgroundColor,
    ),
    toggleableActiveColor: primaryColor,
    iconTheme: const IconThemeData(
      color: primaryColor,
    ),
    textTheme: textTheme,
  );
}
