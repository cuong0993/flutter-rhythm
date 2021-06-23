import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../preferences.dart';

final localeProvider = StateNotifierProvider<LocaleController, Locale?>((ref) {
  final localeName = ref.read(sharedUtilityProvider).getLocaleName();
  final locale = (localeName != null)
      ? Locale.fromSubtags(languageCode: localeName)
      : null;
  return LocaleController(ref.read, locale);
});

class LocaleController extends StateNotifier<Locale?> {
  final Reader _read;

  LocaleController(this._read, Locale? defaultLocale) : super(defaultLocale);

  Future setLocale(BuildContext context, Locale locale) async {
    await _read(sharedUtilityProvider).setLocaleName(locale.toString());
    state = locale;
  }
}
