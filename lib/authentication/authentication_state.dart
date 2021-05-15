import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  factory AuthenticationState.loading() = AuthenticationStateLoading;

  factory AuthenticationState.anonymousAuthenticated() =
      AuthenticationStateAnonymousAuthenticated;

  factory AuthenticationState.googleAuthenticated() =
      AuthenticationStateGoogleAuthenticated;

  factory AuthenticationState.facebookAuthenticated() =
      AuthenticationStateFacebookAuthenticated;

  factory AuthenticationState.unauthenticated() =
      AuthenticationStateUnauthenticated;
}
