import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../user/user_repository.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this._userRepository) : super(Uninitialized());
  final _googleSignIn = GoogleSignIn();
  final _facebookLogin = FacebookLogin();
  final UserRepository _userRepository;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is SignInAnonymouslyEvent) {
      yield* _mapSignInAnonymouslyEventToState();
    } else if (event is SignInWithGoogleEvent) {
      yield* _mapSignInWithGoogleEventToState();
    } else if (event is SignInWithFacebookEvent) {
      yield* _mapSignInWithFacebookEventToState();
    }
  }

  Stream<AuthenticationState> _mapSignInAnonymouslyEventToState() async* {
    try {
      await Firebase.initializeApp();
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        await FirebaseAuth.instance.signInAnonymously();
      }
      _userRepository.changUser();
      yield Authenticated('Anonymous');
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapSignInWithGoogleEventToState() async* {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _tryToLinkWithCurrentUser(credential);
      _userRepository.changUser();
      yield Authenticated('Google');
    } on Exception {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapSignInWithFacebookEventToState() async* {
    try {
      final result = await _facebookLogin.logIn(['email', 'public_profile']);
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          final credential =
              FacebookAuthProvider.credential(result.accessToken.token);
          await _tryToLinkWithCurrentUser(credential);
          _userRepository.changUser();
          yield Authenticated('Facebook');
          break;
        default:
          yield Unauthenticated();
      }
    } on Exception {
      yield Unauthenticated();
    }
  }

  Future<void> _tryToLinkWithCurrentUser(OAuthCredential authCredential) async {
    try {
      await FirebaseAuth.instance.currentUser
          .linkWithCredential(authCredential);
    } on Exception {
      await FirebaseAuth.instance.signInWithCredential(authCredential);
    }
  }
}
