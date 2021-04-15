import 'package:built_value/built_value.dart';

part 'authentication_event.g.dart';

abstract class AuthenticationEvent {}

abstract class SignInAnonymouslyEvent
    implements
        Built<SignInAnonymouslyEvent, SignInAnonymouslyEventBuilder>,
        AuthenticationEvent {
  factory SignInAnonymouslyEvent(
          [Function(SignInAnonymouslyEventBuilder) updates]) =
      _$SignInAnonymouslyEvent;

  SignInAnonymouslyEvent._();
}

abstract class SignInWithGoogleEvent
    implements
        Built<SignInWithGoogleEvent, SignInWithGoogleEventBuilder>,
        AuthenticationEvent {
  factory SignInWithGoogleEvent(
          [Function(SignInWithGoogleEventBuilder) updates]) =
      _$SignInWithGoogleEvent;

  SignInWithGoogleEvent._();
}

abstract class SignInWithFacebookEvent
    implements
        Built<SignInWithFacebookEvent, SignInWithFacebookEventBuilder>,
        AuthenticationEvent {
  factory SignInWithFacebookEvent(
          [Function(SignInWithFacebookEventBuilder) updates]) =
      _$SignInWithFacebookEvent;

  SignInWithFacebookEvent._();
}
