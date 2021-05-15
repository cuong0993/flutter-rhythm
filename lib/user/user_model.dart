import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../authentication/authentication_model.dart';
import '../instrument/instruments_model.dart';
import 'user.dart';
import 'user_repository_impl.dart';

final userProvider = StateNotifierProvider<UserModel, AsyncValue<User>>((ref) {
  ref.watch(authenticationProvider);
  return UserModel(ref.read);
});

class UserModel extends StateNotifier<AsyncValue<User>> {
  UserModel(this._read) : super(const AsyncValue.loading()) {
    {
      _subscription?.cancel();
      _subscription =
          _read(userRepositoryProvider).observeCurrentUser().listen((user) {
        _read(selectedInstrumentIdProvider).state = user.instrumentId;
        state = AsyncValue.data(user);
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
