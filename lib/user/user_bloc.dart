import 'dart:async';

import 'package:bloc/bloc.dart';

import '../instrument/instruments_repository.dart';
import '../midi_processor.dart';
import 'user_event.dart';
import 'user_repository.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  final InstrumentsRepository _instrumentsRepository;

  UserBloc(this._instrumentsRepository,
      {required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UserLoading()) {
    _userRepository.getCurrentUser().listen((user) async {
      final instruments = await _instrumentsRepository.instruments();
      add(UpdateUser((b) => b
        ..user = user
        ..instruments = instruments));
    });
  }

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UpdateUser) {
      if (state is UserLoading ||
          (state is UserUpdated &&
              ((state as UserUpdated).user.user.instrumentId !=
                  event.user.user.instrumentId))) {
        final instrument = (await _instrumentsRepository.instruments())
            .firstWhere(
                (instrument) => instrument.id == event.user.user.instrumentId);
        MidiProcessor.getInstance().changeInstrument(instrument);
      }
      yield UserUpdated((b) => b
        ..user = event.user
        ..instruments = event.instruments);
    } else if (event is ChangeInstrument) {
      _userRepository.changeInstrument(event.instrumentId);
    }
  }
}
