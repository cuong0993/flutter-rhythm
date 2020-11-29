import 'dart:async';

import 'package:bloc/bloc.dart';

import '../instrument/instruments_repository.dart';
import '../midi_processor.dart';
import '../user/user_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository _userRepository;
  final InstrumentsRepository _instrumentsRepository;

  final _userUpLevelEventController = StreamController<AppUser>();

  Stream<AppUser> get userUpLevelStream => _userUpLevelEventController.stream;

  HomeBloc(this._userRepository, this._instrumentsRepository)
      : super(HomeInitial()) {
    _userRepository.getCurrentUser().listen((user) async {
      if (state is HomeInitial) {
        final instrument = (await _instrumentsRepository.instruments())
            .firstWhere(
                (instrument) => instrument.id == user.user.instrumentId);
        MidiProcessor.getInstance().onSelectInstrument(instrument);
      } else if (state is HomeUpdated) {
        final oldUser = (state as HomeUpdated).user;
        if (oldUser.user.instrumentId != user.user.instrumentId) {
          final instrument = (await _instrumentsRepository.instruments())
              .firstWhere(
                  (instrument) => instrument.id == user.user.instrumentId);
          MidiProcessor.getInstance().onSelectInstrument(instrument);
        }
      }
      if (state is HomeUpdated) {
        final oldUser = (state as HomeUpdated).user;
        if (oldUser.user.id == user.user.id &&
            oldUser.user.level != user.user.level) {
          _userUpLevelEventController.add(user);
        }
      }
      add(HomeUpdate(user));
    });
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeUpdate) {
      yield HomeUpdated(event.user);
    }
  }

  @override
  Future<void> close() {
    _userUpLevelEventController.close();
    return super.close();
  }
}
