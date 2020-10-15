import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../authentication/authentication_bloc.dart';
import '../authentication/authentication_state.dart';
import 'user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthenticationBloc _authenticationBloc;
  StreamSubscription _authenticationSubscription;

  UserBloc({@required AuthenticationBloc authenticationBloc})
      : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc,
        super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      await _authenticationSubscription?.cancel();
      _authenticationSubscription = FirebaseFirestore.instance
          .collection('users')
          .doc((_authenticationBloc.state as Authenticated).userId)
          .snapshots()
          .listen((event) {
        add(UpdateUser(User.fromJson(event.data())));
      });
    } else if (event is UpdateUser) {
      yield UserUpdated(event.user);
    }
  }

  @override
  Future<void> close() {
    _authenticationSubscription?.cancel();
    return super.close();
  }
}
