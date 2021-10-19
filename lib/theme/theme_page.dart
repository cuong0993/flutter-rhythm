import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme_controller.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            L10n.of(context)!.txt_theme,
            style: Theme.of(context).appBarTheme.toolbarTextStyle,
          ),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final themeMode = ref.watch(themeModeProvider);
            return Scrollbar(
              isAlwaysShown: true,
              child: ListView.builder(
                itemCount: ThemeMode.values.length,
                itemBuilder: (context, index) => RadioListTile<ThemeMode>(
                  title: Text(
                    getThemeName(context, ThemeMode.values[index]),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  value: ThemeMode.values[index],
                  groupValue: themeMode,
                  onChanged: (value) {
                    ref
                        .read(themeModeProvider.notifier)
                        .setThemeMode(context, value!);
                  },
                ),
              ),
            );
          },
        ),
      );
}

String getThemeName(BuildContext context, ThemeMode themeMode) {
  switch (themeMode) {
    case ThemeMode.dark:
      return L10n.of(context)!.dark;
    case ThemeMode.light:
      return L10n.of(context)!.light;
    case ThemeMode.system:
      return L10n.of(context)!.system;
  }
}
