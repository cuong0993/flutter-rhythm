import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../preferences.dart';

final themeModeProvider = StateNotifierProvider<ThemeModel, ThemeMode>((ref) {
  final themeName = ref.read(sharedUtilityProvider).getThemeName();
  final themeMode = ThemeMode.values.firstWhere(
      (element) => element.toString() == themeName,
      orElse: () => ThemeMode.system);
  return ThemeModel(themeMode);
});

class ThemeModel extends StateNotifier<ThemeMode> {
  ThemeModel(this.defaultThemeMode) : super(defaultThemeMode);

  final ThemeMode defaultThemeMode;

  Future setThemeMode(BuildContext context, ThemeMode themeMode) async {
    await context
        .read(sharedUtilityProvider)
        .setThemeName(themeMode.toString());
    state = themeMode;
  }
}
