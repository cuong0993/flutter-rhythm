part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserLoading extends UserState {
  @override
  List<Object?> get props => [];
}

class UserUpdated extends UserState {
  final AppUser user;
  final List<Instrument> instruments;

  UserUpdated(this.user, this.instruments);

  @override
  List<Object?> get props => [user, instruments];
}
