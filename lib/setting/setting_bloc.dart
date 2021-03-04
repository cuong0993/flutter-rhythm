import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../preferences.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState(null, null)) {
    loadSetting();
  }

  Future loadSetting() async {
    final localeName = await Preferences.getLocaleName();
    final themeName = await Preferences.getThemeName();

    final locale = (localeName != null)
        ? Locale.fromSubtags(languageCode: localeName)
        : null;
    final themeMode = (themeName != null)
        ? ThemeMode.values.firstWhere((e) => e.toString() == themeName)
        : null;
    add(LoadThemeAndLocaleEvent(themeMode, locale));
  }

  @override
  Stream<SettingState> mapEventToState(
    SettingEvent event,
  ) async* {
    if (event is ChangeLocaleEvent) {
      await Preferences.setLocaleName(event.locale.languageCode);
      yield SettingState(event.locale, state.themeMode);
    } else if (event is ChangeThemeEvent) {
      await Preferences.setThemeName(event.theme.toString());
      yield SettingState(state.locale, event.theme);
    } else if (event is LoadThemeAndLocaleEvent) {
      yield SettingState(event.locale, event.theme);
    }
  }
}
