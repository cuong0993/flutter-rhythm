import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../main.dart';
import 'setting_bloc.dart';
import 'setting_event.dart';
import 'setting_state.dart';

class ThemeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(builder: (context, state) {
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
                return RadioListTile<String>(
                  title: Text(getThemeName(context, ThemeMode.values[index]),
                      style: Theme.of(context).textTheme.headline6),
                  value: ThemeMode.values[index].toString(),
                  groupValue: state.themeName,
                  onChanged: (value) {
                    BlocProvider.of<SettingBloc>(context)
                        .add(ChangeThemeEvent((b) => b..themeName = value!));
                  },
                );
              },
            ),
          ));
    });
  }
}
