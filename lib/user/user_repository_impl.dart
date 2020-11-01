import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'user.dart' as user;
import 'user_repository.dart';
class LogInWithGoogleFailure implements Exception {}
class LogInWithFacebookFailure implements Exception {}
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl();
  final _googleSignIn = GoogleSignIn();
  final _facebookLogin = FacebookLogin();

  @override
  Future<bool> isAuthenticated() async {
    await Firebase.initializeApp();
    final currentUser = FirebaseAuth.instance.currentUser;
    return currentUser != null;
  }

  @override
  Future<void> signInAnonymously() {
    return FirebaseAuth.instance.signInAnonymously();
  }

  @override
  String getUserId() {
    return FirebaseAuth.instance.currentUser.uid;
  }

  @override
  Stream<user.User> getUser() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(getUserId())
        .snapshots()
        .map((event) => user.User.fromJson(event.data()));
  }

  @override
  Future<void> signInWithFacebook() async {
    final  result =  await _facebookLogin.logIn(['email','public_profile']);
    switch (result.status)
    {
      case FacebookLoginStatus.loggedIn:
        final credential = FacebookAuthProvider.credential(result.accessToken.token);
        await _handleCredential(credential);
        break;
      default:
        throw LogInWithFacebookFailure();
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _handleCredential(credential);
    } on Exception {
      throw LogInWithGoogleFailure();
    }
  }

  Future<void> _handleCredential(OAuthCredential authCredential) async {
    try {
      await FirebaseAuth.instance.currentUser.linkWithCredential(
          authCredential);
    } on Exception {
      try {
        await FirebaseAuth.instance.signInWithCredential(authCredential);
      } on Exception {}
    }
  }
}
