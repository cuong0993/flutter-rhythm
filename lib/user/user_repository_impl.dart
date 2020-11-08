import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import '../util.dart';
import 'user.dart' as user;
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl();

  StreamSubscription _userSubscription;
  final StreamController<AppUser> _userController = BehaviorSubject();

  @override
  Stream<AppUser> getCurrentUser() {
    return _userController.stream;
  }

  @override
  Future<void> changUser() async {
    await _userSubscription?.cancel();
    _userSubscription = FirebaseFirestore.instance
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
    }).listen((user) {
      _userController.add(user);
    });
  }

  @override
  void changeInstrument(String instrumentId) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({'instrumentId': instrumentId});
  }
}
