import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../preferences.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState(Locale('en', ''), ThemeMode.system)) {
    Preferences.getInstance().then((preferences) {
      if (preferences.localeName != null) {
        add(ChangeLocaleEvent(
            Locale.fromSubtags(languageCode: preferences.localeName)));
      }
      if (preferences.themeName != null) {
        add(ChangeThemeEvent(ThemeMode.values.firstWhere((e) => e.toString() == preferences.themeName)));
      }
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
    }
  }
}
