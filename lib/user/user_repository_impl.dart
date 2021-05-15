import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user.dart';
import 'user_repository.dart';

final userRepositoryProvider =
    Provider<UserRepository>((ref) => UserRepositoryImpl());

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl();

  @override
  Stream<User> observeCurrentUser() {
    final firebaseUser = firebase.FirebaseAuth.instance.currentUser!;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .snapshots()
        .where((event) => event.exists)
        .map((event) => User.fromJson(event.data()!));
  }

  @override
  void update(String name, String photoUrl) {
    final firebaseUser = firebase.FirebaseAuth.instance.currentUser!;
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .update(<String, dynamic>{
      'name': name,
      'photoUrl': photoUrl,
      'anonymous': false
    });
  }
}
