import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  factory AuthenticationState.loading() = AuthenticationStateLoading;

  factory AuthenticationState.authenticated() =
      AuthenticationStateAuthenticated;

  factory AuthenticationState.unauthenticated() =
      AuthenticationStateUnauthenticated;
}
