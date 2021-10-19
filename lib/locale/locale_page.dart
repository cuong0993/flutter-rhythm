import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'locale_controller.dart';

const localeStrings = {
  'en': 'English',
  'ko': '한국어',
  'vi': 'Tiếng Việt',
  'zh': '汉语'
};

class LocalePage extends ConsumerWidget {
  const LocalePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(
          title: Text(
            L10n.of(context)!.txt_language,
            style: Theme.of(context).appBarTheme.toolbarTextStyle,
          ),
        ),
        body: Scrollbar(
          isAlwaysShown: true,
          child: ListView.builder(
            itemCount: L10n.supportedLocales.length,
            itemBuilder: (context, index) => RadioListTile<Locale>(
              title: Text(
                localeStrings[L10n.supportedLocales[index].languageCode]!,
                style: Theme.of(context).textTheme.headline6,
              ),
              value: L10n.supportedLocales[index],
              groupValue: Localizations.localeOf(context),
              onChanged: (value) {
                ref.read(localeProvider.notifier).setLocale(context, value!);
              },
            ),
          ),
        ),
      );
}
