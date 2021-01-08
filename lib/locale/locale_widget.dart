import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../generated/l10n.dart';
import 'locale_bloc.dart';

const map = {'en': 'English', 'ko': '한국어', 'vi': 'Tiếng Việt', 'zh': '汉语'};

class LocaleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return Scaffold(
        appBar: AppBar(
            title: Text(S.of(context).txt_select_language,
                style: Theme.of(context).appBarTheme.textTheme.headline5)),
        body: Scrollbar(
          isAlwaysShown: true,
          controller: scrollController,
          child: ListView.builder(
            controller: scrollController,
            itemCount: S.delegate.supportedLocales.length,
            itemBuilder: (context, index) {
              return RadioListTile<Locale>(
                title: Text(
                    map[S.delegate.supportedLocales[index].languageCode],
                    style: Theme.of(context).textTheme.headline6),
                value: S.delegate.supportedLocales[index],
                groupValue: Localizations.localeOf(context),
                onChanged: (Locale value) {
                  BlocProvider.of<LocaleBloc>(context)
                    ..add(
                        ChangeLocaleEvent(S.delegate.supportedLocales[index]));
                },
              );
            },
          ),
        ));
  }
}
