import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'user.dart';
import 'user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  StreamSubscription _userSubscription;

  UserBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(UserInitial()) {
    _userRepository.getCurrentUser().listen((user) {
      add(UpdateUser(user));
    });
  }

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UpdateUser) {
      yield UserUpdated(event.user);
    }
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
