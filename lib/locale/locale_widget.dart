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
        appBar: AppBar(title: Text(S.of(context).txt_select_language)),
        body: Scrollbar(
          isAlwaysShown: true,
          controller: scrollController,
          child: ListView.builder(
            controller: scrollController,
            itemCount: S.delegate.supportedLocales.length,
            itemBuilder: (context, index) {
              return ListTile(
                  selected: Localizations.localeOf(context) ==
                      S.delegate.supportedLocales[index],
                  selectedTileColor: Theme.of(context).colorScheme.onError,
                  onTap: () {
                    BlocProvider.of<LocaleBloc>(context)
                      ..add(ChangeLocaleEvent(
                          S.delegate.supportedLocales[index]));
                  },
                  title: Text(
                      map[S.delegate.supportedLocales[index].languageCode]));
            },
          ),
        ));
  }
}
