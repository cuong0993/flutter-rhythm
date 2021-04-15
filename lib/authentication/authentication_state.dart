import 'package:built_value/built_value.dart';

part 'authentication_state.g.dart';

abstract class AuthenticationState {}

abstract class Uninitialized
    implements Built<Uninitialized, UninitializedBuilder>, AuthenticationState {
  factory Uninitialized([Function(UninitializedBuilder) updates]) =
      _$Uninitialized;

  Uninitialized._();
}

abstract class Authenticated
    implements Built<Authenticated, AuthenticatedBuilder>, AuthenticationState {
  String get type;

  factory Authenticated([Function(AuthenticatedBuilder) updates]) =
      _$Authenticated;

  Authenticated._();
}

abstract class Unauthenticated
    implements
        Built<Unauthenticated, UnauthenticatedBuilder>,
        AuthenticationState {
  factory Unauthenticated([Function(UnauthenticatedBuilder) updates]) =
      _$Unauthenticated;

  Unauthenticated._();
}
