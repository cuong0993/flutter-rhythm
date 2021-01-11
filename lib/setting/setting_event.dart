part of 'setting_bloc.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();
}

class ChangeLocaleEvent extends SettingEvent {
  final Locale locale;

  ChangeLocaleEvent(this.locale);

  @override
  List<Object> get props => [locale];
}

class ChangeThemeEvent extends SettingEvent {
  final ThemeMode theme;

  ChangeThemeEvent(this.theme);

  @override
  List<Object> get props => [theme];
}
