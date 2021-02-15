import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../preferences.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState(null, null)) {
    Preferences.getInstance().then((preferences) {
      final locale = (preferences.localeName != null)
          ? Locale.fromSubtags(languageCode: preferences.localeName)
          : null;
      final themeMode = (preferences.themeName != null)
          ? ThemeMode.values
              .firstWhere((e) => e.toString() == preferences.themeName)
          : ThemeMode.system;
      add(LoadThemeAndLocaleEvent(themeMode, locale));
    });
  }

  @override
  Stream<SettingState> mapEventToState(
    SettingEvent event,
  ) async* {
    if (event is ChangeLocaleEvent) {
      await Preferences.getInstance().then((preferences) {
        preferences.localeName = event.locale.languageCode;
      });
      yield SettingState(event.locale, state.themeMode);
    } else if (event is ChangeThemeEvent) {
      await Preferences.getInstance().then((preferences) {
        preferences.themeName = event.theme.toString();
      });
      yield SettingState(state.locale, event.theme);
    } else if (event is LoadThemeAndLocaleEvent) {
      yield SettingState(event.locale, event.theme);
    }
  }
}
