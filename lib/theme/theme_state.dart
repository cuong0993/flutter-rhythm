part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class ThemeInitial extends ThemeState {
  @override
  List<Object> get props => [];
}

class ThemeChanged extends ThemeState {
  final ThemeMode theme;

  ThemeChanged(this.theme);

  @override
  List<Object> get props => [theme];
}
