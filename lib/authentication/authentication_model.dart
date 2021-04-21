import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../user/user_repository.dart';
import '../user/user_repository_impl.dart';
import 'authentication_state.dart';

final authenticationProvider =
    StateNotifierProvider<AuthenticationModel, AuthenticationState>((ref) {
  return AuthenticationModel(ref.read(userRepositoryProvider))
    .._checkAndSignInAnonymously();
});

class AuthenticationModel extends StateNotifier<AuthenticationState> {
  AuthenticationModel(this._userRepository) : super(Uninitialized());
  final _googleSignIn = GoogleSignIn();
  final _facebookLogin = FacebookAuth.instance;
  final UserRepository _userRepository;

  Future _checkAndSignInAnonymously() async {
    try {
      await Firebase.initializeApp();
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        await FirebaseAuth.instance.signInAnonymously();
      }
      _userRepository.subscribeUser();
      state = Authenticated((b) => b..type = 'Anonymous');
    } catch (_) {
      state = Unauthenticated();
    }
  }

  Future signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _tryToLinkWithCurrentUser(credential);
      _userRepository.subscribeUser();
      state = Authenticated((b) => b..type = 'Google');
    } on Exception {
      state = Unauthenticated();
    }
  }

  Future signInWithFacebook() async {
    try {
      final loginResult = await _facebookLogin.login(
          loginBehavior: LoginBehavior.NATIVE_WITH_FALLBACK);
      final credential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      await _tryToLinkWithCurrentUser(credential);
      _userRepository.subscribeUser();
      state = Authenticated((b) => b..type = 'Facebook');
    } on Exception {
      state = Unauthenticated();
    }
  }

  Future<void> _tryToLinkWithCurrentUser(OAuthCredential authCredential) async {
    try {
      await FirebaseAuth.instance.currentUser!
          .linkWithCredential(authCredential);
    } on Exception {
      await FirebaseAuth.instance.signInWithCredential(authCredential);
    }
  }
}
