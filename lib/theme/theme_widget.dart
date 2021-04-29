import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme_model.dart';

class ThemeWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final themeMode = watch(themeModeProvider);
    final scrollController = ScrollController();
    return Scaffold(
        appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.txt_theme,
                style: Theme.of(context).appBarTheme.textTheme!.headline5)),
        body: Scrollbar(
          isAlwaysShown: true,
          controller: scrollController,
          child: ListView.builder(
            controller: scrollController,
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
        ));
  }
}

String getThemeName(BuildContext context, ThemeMode themeMode) {
  switch (themeMode) {
    case ThemeMode.dark:
      return AppLocalizations.of(context)!.dark;
    case ThemeMode.light:
      return AppLocalizations.of(context)!.light;
    case ThemeMode.system:
      return AppLocalizations.of(context)!.system;
    default:
      return '';
  }
}
