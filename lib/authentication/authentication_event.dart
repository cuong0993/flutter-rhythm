import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {}

class StartAuthentication extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}
