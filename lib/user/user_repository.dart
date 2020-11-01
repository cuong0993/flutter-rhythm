import 'user.dart';

abstract class UserRepository {
  Future<bool> isAuthenticated();

  Future<void> signInAnonymously();

  Future<void> signInWithGoogle();

  Future<void> signInWithFacebook();

  String getUserId();

  Stream<User> getUser();
}
