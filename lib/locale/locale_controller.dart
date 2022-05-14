import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../preferences.dart';

final localeProvider = StateNotifierProvider<LocaleController, Locale?>((ref) {
  final localeName = ref.read(sharedUtilityProvider).getLocaleName();
  final locale = (localeName != null)
      ? Locale.fromSubtags(languageCode: localeName)
      : null;

  return LocaleController(ref, locale);
});

class LocaleController extends StateNotifier<Locale?> {
  LocaleController(this._read, Locale? defaultLocale) : super(defaultLocale);

  final StateNotifierProviderRef _read;

  Future setLocale(Locale locale) async {
    await _read.read(sharedUtilityProvider).setLocaleName(locale.toString());
    state = locale;
  }
}
