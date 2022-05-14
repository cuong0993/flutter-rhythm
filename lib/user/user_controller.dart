import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../authentication/authentication_controller.dart';
import '../instrument/instruments_controller.dart';
import 'user.dart';
import 'user_repository_impl.dart';

final userProvider =
    StateNotifierProvider<UserController, AsyncValue<User>>((ref) {
  ref.watch(authenticationProvider);

  return UserController(ref);
});

class UserController extends StateNotifier<AsyncValue<User>> {
  UserController(this._read) : super(const AsyncValue.loading()) {
    {
      final firebaseUser = firebase.FirebaseAuth.instance.currentUser;
      if (firebaseUser != null) {
        _subscription?.cancel();
        _subscription = _read
            .read(userRepositoryProvider)
            .observeCurrentUser()
            .listen((user) {
          _read.read(selectedInstrumentIdProvider.notifier).state =
              user.instrumentId;
          state = AsyncValue.data(user);
        });
      } else {
        state = const AsyncValue.error('Unauthenticated', StackTrace.empty);
      }
    }
  }

  StreamSubscription? _subscription;
  final StateNotifierProviderRef _read;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
