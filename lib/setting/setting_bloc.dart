import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../preferences.dart';
import 'setting_event.dart';
import 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc()
      : super(SettingState((b) => b
          ..locale = null
          ..themeName = null)) {
    loadSetting();
  }

  Future loadSetting() async {
    final localeName = await Preferences.getLocaleName();
    final themeName = await Preferences.getThemeName();

    final locale = (localeName != null)
        ? Locale.fromSubtags(languageCode: localeName)
        : null;
    add(LoadThemeAndLocaleEvent((b) => b
      ..themeName = themeName
      ..locale = locale));
  }

  @override
  Stream<SettingState> mapEventToState(
    SettingEvent event,
  ) async* {
    if (event is ChangeLocaleEvent) {
      await Preferences.setLocaleName(event.locale.languageCode);
      yield SettingState((b) => b
        ..locale = event.locale
        ..themeName = state.themeName);
    } else if (event is ChangeThemeEvent) {
      await Preferences.setThemeName(event.themeName);
      yield SettingState((b) => b
        ..locale = state.locale
        ..themeName = event.themeName);
    } else if (event is LoadThemeAndLocaleEvent) {
      yield SettingState((b) => b
        ..locale = event.locale
        ..themeName = event.themeName);
    }
  }
}
