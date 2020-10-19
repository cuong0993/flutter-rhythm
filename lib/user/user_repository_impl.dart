import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'user.dart' as user;

import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepositoryImpl({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<bool> isAuthenticated() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  @override
  Future<void> signInAnonymously() {
    return _firebaseAuth.signInAnonymously();
  }

  @override
  String getUserId() {
    return _firebaseAuth.currentUser.uid;
  }

  @override
  Stream<user.User> getUser() {
        return FirebaseFirestore.instance.collection('users').doc(getUserId()).snapshots().map((event) => user.User.fromJson(event.data()));
  }
}
