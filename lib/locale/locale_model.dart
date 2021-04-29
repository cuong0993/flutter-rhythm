import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../preferences.dart';

final localeProvider = StateNotifierProvider<LocaleModel, Locale?>((ref) {
  final localeName = ref.read(sharedUtilityProvider).getLocaleName();
  final locale = (localeName != null)
      ? Locale.fromSubtags(languageCode: localeName)
      : null;
  return LocaleModel(locale);
});

class LocaleModel extends StateNotifier<Locale?> {
  LocaleModel(this.defaultLocale) : super(defaultLocale);

  final Locale? defaultLocale;

  Future setLocale(BuildContext context, Locale locale) async {
    await context.read(sharedUtilityProvider).setLocaleName(locale.toString());
    state = locale;
  }
}
