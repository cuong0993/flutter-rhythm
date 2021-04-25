import 'user.dart';

abstract class UserRepository {
  void changeInstrument(String instrumentId);

  Stream<AppUser> observeCurrentUser();
}

class AppUser {
  final String name;
  final String photoUrl;
  final bool isAnonymous;
  final DateTime creationTime;
  final User user;

  AppUser(
      this.name, this.photoUrl, this.user, this.isAnonymous, this.creationTime);
}
