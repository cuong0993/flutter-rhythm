import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../serializers.dart';
import '../util.dart';
import 'user.dart' as user;
import 'user_repository.dart';

final userRepositoryProvider =
    Provider<UserRepositoryImpl>((ref) => UserRepositoryImpl());

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl();

  @override
  Stream<AppUser> observeCurrentUser() {
    final firebaseUser = FirebaseAuth.instance.currentUser!;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .snapshots()
        .where((event) => event.exists)
        .map((event) {
      var photoUrl = '';
      var name = '';
      firebaseUser.providerData.forEach((userInfo) {
        if (userInfo.providerId == 'facebook.com') {
          photoUrl =
              '${userInfo.photoURL}?height=${96.toPixel()}&width=${96.toPixel()}';
        } else if (userInfo.providerId == 'google.com') {
          photoUrl =
              userInfo.photoURL!.replaceAll('s96-c', 's${96.toPixel()}-c');
        }
        name = userInfo.displayName!;
      });
      return AppUser(
          name,
          photoUrl,
          serializers.deserializeWith<user.User>(
              user.User.serializer, event.data())!,
          FirebaseAuth.instance.currentUser!.isAnonymous,
          FirebaseAuth.instance.currentUser!.metadata.creationTime!);
    });
  }

  @override
  void changeInstrument(String instrumentId) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(<String, dynamic>{'instrumentId': instrumentId});
  }
}
