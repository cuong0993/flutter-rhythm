import 'user.dart';

abstract class UserRepository {
  void changUser();
  void changeInstrument(String instrumentId);
  Stream<AppUser> getCurrentUser();
}

class AppUser {
  final String name;
  final String photoUrl;
  final User user;
  AppUser(this.name, this.photoUrl, this.user);
}
