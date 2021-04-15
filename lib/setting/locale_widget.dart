import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'setting_bloc.dart';
import 'setting_event.dart';

const map = {'en': 'English', 'ko': '한국어', 'vi': 'Tiếng Việt', 'zh': '汉语'};

class LocaleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return Scaffold(
        appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.txt_language,
                style: Theme.of(context).appBarTheme.textTheme!.headline5)),
        body: Scrollbar(
          isAlwaysShown: true,
          controller: scrollController,
          child: ListView.builder(
            controller: scrollController,
            itemCount: AppLocalizations.supportedLocales.length,
            itemBuilder: (context, index) {
              return RadioListTile<Locale>(
                title: Text(
                    map[AppLocalizations.supportedLocales[index].languageCode]!,
                    style: Theme.of(context).textTheme.headline6),
                value: AppLocalizations.supportedLocales[index],
                groupValue: Localizations.localeOf(context),
                onChanged: (value) {
                  BlocProvider.of<SettingBloc>(context).add(ChangeLocaleEvent(
                      (b) => b
                        ..locale = AppLocalizations.supportedLocales[index]));
                },
              );
            },
          ),
        ));
  }
}
