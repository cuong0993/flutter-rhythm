import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import '../serializers.dart';
import '../util.dart';
import 'user.dart' as user;
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl();

  StreamSubscription? _userSubscription;
  final _userController = BehaviorSubject<AppUser>();

  @override
  Stream<AppUser> getCurrentUser() {
    return _userController.stream;
  }

  @override
  Future<void> subscribeUser() async {
    await _userSubscription?.cancel();
    _userSubscription = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((event) {
      var photoUrl = '';
      var name = '';
      FirebaseAuth.instance.currentUser!.providerData.forEach((userInfo) {
        if (userInfo.providerId == 'facebook.com') {
          photoUrl = '${userInfo.photoURL}?height=${96.toPixel()}';
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
              user.User.serializer, event.data() as Object)!,
          FirebaseAuth.instance.currentUser!.isAnonymous,
          FirebaseAuth.instance.currentUser!.metadata.creationTime!);
    }).listen((user) {
      _userController.add(user);
    });
  }

  @override
  void changeInstrument(String instrumentId) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'instrumentId': instrumentId});
  }
}
