import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../user/user_repository_impl.dart';
import 'authentication_state.dart';

final authenticationProvider =
    StateNotifierProvider<AuthenticationController, AuthenticationState>(
  (ref) => AuthenticationController(ref.read),
);

class AuthenticationController extends StateNotifier<AuthenticationState> {
  AuthenticationController(this._read) : super(AuthenticationState.loading()) {
    Future.microtask(() async {
      try {
        final currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser == null) {
          await FirebaseAuth.instance.signInAnonymously();
        }
        state = AuthenticationState.authenticated();
      } on FirebaseException catch (_) {
        state = AuthenticationState.unauthenticated();
      }
    });
  }

  final _googleSignIn = GoogleSignIn();
  final _facebookLogin = FacebookAuth.instance;
  final Reader _read;

  Future signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _tryToLinkWithCurrentUser(credential);
      state = AuthenticationState.authenticated();
    } on Exception {
      state = AuthenticationState.unauthenticated();
    }
  }

  Future signInWithFacebook() async {
    try {
      final loginResult = await _facebookLogin.login(
        loginBehavior: LoginBehavior.nativeWithFallback,
      );
      final credential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      await _tryToLinkWithCurrentUser(credential);
      state = AuthenticationState.authenticated();
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
      var photoUrl = '';
      if (userInfo.providerId == 'google.com') {
        photoUrl = userInfo.profile!['picture'] as String;
      } else if (userInfo.providerId == 'facebook.com') {
        // ignore: avoid_dynamic_calls
        photoUrl = userInfo.profile!['picture']['data']['url'] as String;
      }
      _read(userRepositoryProvider).update(name, photoUrl);
    } on Exception {
      final userInfo =
          (await FirebaseAuth.instance.signInWithCredential(authCredential))
              .additionalUserInfo!;
      final name = userInfo.profile!['name'] as String;
      var photoUrl = '';
      if (userInfo.providerId == 'google.com') {
        photoUrl = userInfo.profile!['picture'] as String;
      } else if (userInfo.providerId == 'facebook.com') {
        // ignore: avoid_dynamic_calls
        photoUrl = userInfo.profile!['picture']['data']['url'] as String;
      }
      _read(userRepositoryProvider).update(name, photoUrl);
    }
  }
}
