import 'dart:ui';

import 'package:built_value/built_value.dart';

part 'setting_event.g.dart';

abstract class SettingEvent {}

abstract class ChangeLocaleEvent
    implements
        Built<ChangeLocaleEvent, ChangeLocaleEventBuilder>,
        SettingEvent {
  factory ChangeLocaleEvent([Function(ChangeLocaleEventBuilder) updates]) =
      _$ChangeLocaleEvent;

  ChangeLocaleEvent._();

  Locale get locale;
}

abstract class ChangeThemeEvent
    implements Built<ChangeThemeEvent, ChangeThemeEventBuilder>, SettingEvent {
  factory ChangeThemeEvent([Function(ChangeThemeEventBuilder) updates]) =
      _$ChangeThemeEvent;

  ChangeThemeEvent._();

  String get themeName;
}

abstract class LoadThemeAndLocaleEvent
    implements
        Built<LoadThemeAndLocaleEvent, LoadThemeAndLocaleEventBuilder>,
        SettingEvent {
  factory LoadThemeAndLocaleEvent(
          [Function(LoadThemeAndLocaleEventBuilder) updates]) =
      _$LoadThemeAndLocaleEvent;

  LoadThemeAndLocaleEvent._();

  String? get themeName;

  Locale? get locale;
}
