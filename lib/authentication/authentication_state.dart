import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final String type;

  const Authenticated(this.type);

  @override
  List<Object?> get props => [type];

  @override
  String toString() => 'Authenticated { type: $type }';
}

class Unauthenticated extends AuthenticationState {}
