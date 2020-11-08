import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../preferences.dart';

part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(LocaleInitial()) {
    Preferences.getInstance().then((preferences) {
      if (preferences.localeName != null) {
        add(ChangeLocaleEvent(
            Locale.fromSubtags(languageCode: preferences.localeName)));
      }
    });
  }

  @override
  Stream<LocaleState> mapEventToState(
    LocaleEvent event,
  ) async* {
    if (event is ChangeLocaleEvent) {
      await Preferences.getInstance().then((preferences) {
        preferences.localeName = event.locale.languageCode;
      });
      yield LocaleChanged(event.locale);
    }
  }
}
