import 'package:equatable/equatable.dart';

import '../user/user_repository.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeUpdate extends HomeEvent {
  final AppUser user;

  const HomeUpdate(this.user);

  @override
  List<Object> get props => [user];
}
