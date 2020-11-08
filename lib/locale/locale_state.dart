part of 'locale_bloc.dart';

abstract class LocaleState extends Equatable {
  const LocaleState();
}

class LocaleInitial extends LocaleState {
  @override
  List<Object> get props => [];
}

class LocaleChanged extends LocaleState {
  final Locale locale;

  LocaleChanged(this.locale);

  @override
  List<Object> get props => [locale];
}
