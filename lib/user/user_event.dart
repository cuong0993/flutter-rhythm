part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UpdateUser extends UserEvent {
  final AppUser user;
  final List<Instrument> instruments;

  UpdateUser(this.user, this.instruments);

  @override
  List<Object?> get props => [user, instruments];
}

class ChangeInstrument extends UserEvent {
  final String instrumentId;

  ChangeInstrument(this.instrumentId);

  @override
  List<Object?> get props => [instrumentId];
}
