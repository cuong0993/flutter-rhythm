import 'dart:async';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../user/user_repository_impl.dart';
import 'authentication_state.dart';

final authenticationProvider =
    StateNotifierProvider<AuthenticationModel, AuthenticationState>((ref) {
  return AuthenticationModel(ref.read).._checkAndSignInAnonymously();
});

class AuthenticationModel extends StateNotifier<AuthenticationState> {
  AuthenticationModel(this._read) : super(AuthenticationState.loading());
  final _googleSignIn = GoogleSignIn();
  final _facebookLogin = FacebookAuth.instance;
  final Reader _read;

  Future _checkAndSignInAnonymously() async {
    try {
      await Firebase.initializeApp();
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        await FirebaseAuth.instance.signInAnonymously();
      }
      state = AuthenticationState.anonymousAuthenticated();
    } catch (_) {
      state = AuthenticationState.unauthenticated();
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
      state = AuthenticationState.googleAuthenticated();
    } on Exception {
      state = AuthenticationState.unauthenticated();
    }
  }

  Future signInWithFacebook() async {
    try {
      final loginResult = await _facebookLogin.login(
          loginBehavior: LoginBehavior.NATIVE_WITH_FALLBACK);
      final credential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      await _tryToLinkWithCurrentUser(credential);
      state = AuthenticationState.facebookAuthenticated();
    } on Exception {
      state = AuthenticationState.unauthenticated();
    }
  }

  Future<void> _tryToLinkWithCurrentUser(OAuthCredential authCredential) async {
    try {
      final userInfo = (await FirebaseAuth.instance.currentUser
              ?.linkWithCredential(authCredential))!
          .additionalUserInfo!;
      final name = userInfo.profile!['name'] as String;
      final photoUrl = (userInfo.providerId == 'google.com')
          ? (userInfo.profile!['picture'] as String)
              .replaceAll('s96-c', 's${96.toPixel()}-c')
          : '';
      _read(userRepositoryProvider).update(name, photoUrl);
    } on Exception {
      final userInfo =
          (await FirebaseAuth.instance.signInWithCredential(authCredential))
              .additionalUserInfo!;
      final name = userInfo.profile!['name'] as String;
      final photoUrl = (userInfo.providerId == 'google.com')
          ? (userInfo.profile!['picture'] as String)
              .replaceAll('s96-c', 's${96.toPixel()}-c')
          : '';
      _read(userRepositoryProvider).update(name, photoUrl);
    }
  }
}

extension DpToPixelConverter on int {
  int toPixel() {
    return (this * window.devicePixelRatio).toInt();
  }
}
