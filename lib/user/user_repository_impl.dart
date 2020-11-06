import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../util.dart';
import 'user.dart' as user;
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl();

  @override
  Stream<AppUser> getCurrentUser() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .snapshots()
        .map((event) {
      var photoUrl = '';
      var name = '';
      FirebaseAuth.instance.currentUser.providerData.forEach((userInfo) {
        if (userInfo.providerId == 'facebook.com') {
          photoUrl = '${userInfo.photoURL}?height=$size96dp';
        } else if (userInfo.providerId == 'google.com') {
          photoUrl = userInfo.photoURL.replaceAll('s96-c', 's$size96dp-c');
        }
        name = userInfo.displayName;
      });
      return AppUser(name, photoUrl, user.User.fromJson(event.data()));
    });
  }

  @override
  void changUser() {
    // TODO: implement setUserId
  }
}
