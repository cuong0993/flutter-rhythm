import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'user.dart' as user;
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl();

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
}
