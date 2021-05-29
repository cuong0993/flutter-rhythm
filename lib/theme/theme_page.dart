import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'theme_model.dart';

class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(L10n.of(context)!.txt_theme,
                style: Theme.of(context).appBarTheme.textTheme!.headline5)),
        body: HookBuilder(builder: (context) {
          final themeMode = useProvider(themeModeProvider);
          return Scrollbar(
            isAlwaysShown: true,
            child: ListView.builder(
              itemCount: ThemeMode.values.length,
              itemBuilder: (context, index) {
                return RadioListTile<ThemeMode>(
                  title: Text(getThemeName(context, ThemeMode.values[index]),
                      style: Theme.of(context).textTheme.headline6),
                  value: ThemeMode.values[index],
                  groupValue: themeMode,
                  onChanged: (value) {
                    context
                        .read(themeModeProvider.notifier)
                        .setThemeMode(context, value!);
                  },
                );
              },
            ),
          );
        }));
  }
}

String getThemeName(BuildContext context, ThemeMode themeMode) {
  switch (themeMode) {
    case ThemeMode.dark:
      return L10n.of(context)!.dark;
    case ThemeMode.light:
      return L10n.of(context)!.light;
    case ThemeMode.system:
      return L10n.of(context)!.system;
    default:
      return '';
  }
}
