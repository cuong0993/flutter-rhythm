import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../instrument/instruments_repository.dart';
import '../instrument/instruments_repository_impl.dart';
import '../midi_processor.dart';
import 'user_repository.dart';
import 'user_repository_impl.dart';
import 'user_state.dart';

final userStateProvider = StateNotifierProvider<UserModel, UserState>((ref) {
  return UserModel(
      ref.read(userRepositoryProvider), ref.read(instrumentRepositoryProvider));
});

class UserModel extends StateNotifier<UserState> {
  UserModel(this._userRepository, this._instrumentRepository)
      : super(UserLoading()) {
    {
      _subscription = _userRepository.getCurrentUser().listen((user) async {
        if (state is UserLoading ||
            (state is UserUpdated &&
                ((state as UserUpdated).user.user.instrumentId !=
                    user.user.instrumentId))) {
          final instrument = (await _instrumentRepository.instruments())
              .firstWhere(
                  (instrument) => instrument.id == user.user.instrumentId);
          MidiProcessor.getInstance().changeInstrument(instrument);
        }
        state = UserUpdated((b) => b..user = user);
      });
    }
  }

  final UserRepository _userRepository;
  final InstrumentsRepository _instrumentRepository;
  StreamSubscription? _subscription;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
