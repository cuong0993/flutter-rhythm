part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserUpdated extends UserState {
  final AppUser user;

  UserUpdated(this.user);

  @override
  List<Object> get props => [user];
}
