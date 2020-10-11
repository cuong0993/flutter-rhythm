import 'package:firebase_auth/firebase_auth.dart';
import 'package:hitnotes/repositories/user_repository.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseUserRepository({FirebaseAuth firebaseAuth})
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
}
