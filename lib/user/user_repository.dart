import 'user.dart';

abstract class UserRepository {
  Future<bool> isAuthenticated();
  Future<void> signInAnonymously();
  String getUserId();
  Stream<User> getUser();
}
