import 'package:firebase_auth/firebase_auth.dart';
import 'package:hitnotes/repositories/user_repository.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseUserRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<bool> isAuthenticated() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<void> signInAnonymously() {
    return _firebaseAuth.signInAnonymously();
  }

  String getUserId() {
    return _firebaseAuth.currentUser.uid;
  }
}
