import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../generated/l10n.dart';

class ThemeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              return RadioListTile<Locale>(
                title: Text(
                    Intl.message(
                      '',
                      name: ThemeMode.values[index].toString().split('.').last,
                      desc: '',
                      args: [],
                    ),
                    style: Theme.of(context).textTheme.headline6),
                value: S.delegate.supportedLocales[index],
                groupValue: Localizations.localeOf(context),
                onChanged: (Locale value) {
                  // BlocProvider.of<LocaleBloc>(context)
                  //   ..add(
                  //       ChangeLocaleEvent(S.delegate.supportedLocales[index]));
                },
              );
            },
          ),
        ));
  }
}
