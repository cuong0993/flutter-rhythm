import 'package:equatable/equatable.dart';
import 'package:hitnotes/user/user_repository.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeUpdated extends HomeState {
  final AppUser user;

  const HomeUpdated(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'HomeUpdated { photoUrl: $user }';
}
