part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UpdateUser extends UserEvent {
  final AppUser user;

  UpdateUser(this.user);

  @override
  List<Object> get props => [user];
}
