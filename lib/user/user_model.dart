import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../authentication/authentication_model.dart';
import '../instrument/instruments_model.dart';
import 'user_repository_impl.dart';
import 'user_state.dart';

final userStateProvider = StateNotifierProvider<UserModel, UserState>((ref) {
  ref.watch(authenticationProvider);
  return UserModel(ref.read);
});

class UserModel extends StateNotifier<UserState> {
  UserModel(this._read) : super(UserLoading()) {
    {
      _subscription?.cancel();
      _subscription =
          _read(userRepositoryProvider).observeCurrentUser().listen((user) {
        _read(selectedInstrumentIdProvider).state = user.instrumentId;
        state = UserUpdated((b) => b..user = user.toBuilder());
      });
    }
  }

  StreamSubscription? _subscription;
  final Reader _read;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
