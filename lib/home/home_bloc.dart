import 'dart:async';

import 'package:bloc/bloc.dart';

import '../instrument/instruments_repository.dart';
import '../midi_processor.dart';
import '../preferences.dart';
import '../user/user.dart';
import '../user/user_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository _userRepository;
  final InstrumentsRepository _instrumentsRepository;
  Stream<User> userUpLevelStream;
  final _showRateEventController = StreamController<bool>();

  Stream<bool> get showRateEventStream => _showRateEventController.stream;

  HomeBloc(this._userRepository, this._instrumentsRepository)
      : super(HomeInitial()) {
    /* 3 days to ask for rate */
    const millisecondsUntilPrompt = (3 * 24 * 60 * 60 * 1000);
    const launchesUntilPrompt = 3;
    Preferences.getInstance().then((preferences) {
      if (preferences.launchCount == 0) {
        preferences.millisecondsFirstLaunch =
            DateTime.now().millisecondsSinceEpoch;
      }
      preferences.launchCount += 1;
      if (preferences.isShowRateDialogAgain &&
          preferences.launchCount >= launchesUntilPrompt) {
        if (DateTime.now().millisecondsSinceEpoch -
                preferences.millisecondsFirstLaunch >=
            millisecondsUntilPrompt) {
          _showRateEventController.add(true);
        }
      }
    });
    userUpLevelStream = _userRepository
        .getCurrentUser().map((event) => event.user)
        .distinct((prev, next) => prev.level == next.level)
        .skip(1);
    _userRepository
        .getCurrentUser().map((event) => event.user)
        .map((user) => user.instrumentId)
        .distinct()
        .listen((id) async {
      final instrument = await _instrumentsRepository.getInstrument(id);
      MidiProcessor.getInstance().onSelectInstrument(instrument);
    });
    _userRepository.getCurrentUser().listen((user) {
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
    _showRateEventController.close();
    return super.close();
  }
}
