part of 'setting_bloc.dart';

class SettingState extends Equatable {
  final Locale? locale;
  final ThemeMode? themeMode;

  SettingState(this.locale, this.themeMode);

  @override
  List<Object?> get props => [locale, themeMode];
}
