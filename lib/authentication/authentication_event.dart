import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {}

class SignInAnonymouslyEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class SignInWithGoogleEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class SignInWithFacebookEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}
