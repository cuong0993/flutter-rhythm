import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../user/user_repository.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(Uninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is SignInAnonymouslyEvent) {
      yield* _mapSignInAnonymouslyEventToState();
    }
    else if (event is SignInWithGoogleEvent) {
      yield* _mapSignInWithGoogleEventToState();
    }
    else if (event is SignInWithFacebookEvent) {
      yield* _mapSignInWithFacebookEventToState();
    }
  }

  Stream<AuthenticationState> _mapSignInAnonymouslyEventToState() async* {
    try {
      final isSignedIn = await _userRepository.isAuthenticated();
      if (!isSignedIn) {
        await _userRepository.signInAnonymously();
      }
      final userId = _userRepository.getUserId();
      yield Authenticated(userId);
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapSignInWithGoogleEventToState() async* {
    try {
      await _userRepository.signInWithGoogle();
      yield GoogleAuthenticated('');
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapSignInWithFacebookEventToState() async* {
    try {
      await _userRepository.signInWithFacebook();
      yield FacebookAuthenticated('');
    } catch (_) {
      yield Unauthenticated();
    }
  }
}
