import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../generated/l10n.dart';
import 'setting_bloc.dart';

class ThemeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(builder: (context, state) {
      final scrollController = ScrollController();
      return Scaffold(
          appBar: AppBar(
              title: Text(S.of(context).txt_theme,
                  style: Theme.of(context).appBarTheme.textTheme.headline5)),
          body: Scrollbar(
            isAlwaysShown: true,
            controller: scrollController,
            child: ListView.builder(
              controller: scrollController,
              itemCount: ThemeMode.values.length,
              itemBuilder: (context, index) {
                return RadioListTile<ThemeMode>(
                  title: Text(
                      Intl.message(
                        '',
                        name:
                            ThemeMode.values[index].toString().split('.').last,
                        desc: '',
                        args: [],
                      ),
                      style: Theme.of(context).textTheme.headline6),
                  value: ThemeMode.values[index],
                  groupValue: state.themeMode,
                  onChanged: (ThemeMode value) {
                    BlocProvider.of<SettingBloc>(context)
                      ..add(ChangeThemeEvent(value));
                  },
                );
              },
            ),
          ));
    });
  }
}
