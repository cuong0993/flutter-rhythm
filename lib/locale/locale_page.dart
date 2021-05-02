import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'locale_model.dart';

const localeStrings = {
  'en': 'English',
  'ko': '한국어',
  'vi': 'Tiếng Việt',
  'zh': '汉语'
};

class LocalePage extends StatelessWidget {
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
                    localeStrings[
                        AppLocalizations.supportedLocales[index].languageCode]!,
                    style: Theme.of(context).textTheme.headline6),
                value: AppLocalizations.supportedLocales[index],
                groupValue: Localizations.localeOf(context),
                onChanged: (value) {
                  context
                      .read(localeProvider.notifier)
                      .setLocale(context, value!);
                },
              );
            },
          ),
        ));
  }
}
