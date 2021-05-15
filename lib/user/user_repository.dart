import 'user.dart';

abstract class UserRepository {
  Stream<User> observeCurrentUser();

  void update(String name, String photoUrl);
}
