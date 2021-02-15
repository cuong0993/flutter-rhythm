import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../instrument/instrument.dart';
import '../instrument/instruments_repository.dart';
import '../midi_processor.dart';
import 'user_repository.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  final InstrumentsRepository _instrumentsRepository;

  UserBloc(this._instrumentsRepository,
      {@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(UserLoading()) {
    _userRepository.getCurrentUser().listen((user) async {
      final instruments = await _instrumentsRepository.instruments();
      add(UpdateUser(user, instruments));
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
        MidiProcessor.getInstance().onSelectInstrument(instrument);
      }
      yield UserUpdated(event.user, event.instruments);
    } else if (event is ChangeInstrument) {
      _userRepository.changeInstrument(event.instrumentId);
    }
  }
}
