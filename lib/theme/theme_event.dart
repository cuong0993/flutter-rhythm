part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ChangeThemeEvent extends ThemeEvent {
  final ThemeMode theme;

  ChangeThemeEvent(this.theme);

  @override
  List<Object> get props => [theme];
}