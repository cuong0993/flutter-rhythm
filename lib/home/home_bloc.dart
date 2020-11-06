import 'dart:async';

import 'package:bloc/bloc.dart';

import '../instrument/instruments_repository.dart';
import '../midi_processor.dart';
import '../preferences.dart';
import '../user/user_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository _userRepository;
  final InstrumentsRepository _instrumentsRepository;
  final _showRateEventController = StreamController<bool>();

  Stream<bool> get showRateEventStream => _showRateEventController.stream;
  final _userUpLevelEventController = StreamController<AppUser>();

  Stream<AppUser> get userUpLevelStream => _userUpLevelEventController.stream;

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
        if (DateTime
            .now()
            .millisecondsSinceEpoch -
            preferences.millisecondsFirstLaunch >=
            millisecondsUntilPrompt) {
          _showRateEventController.add(true);
        }
      }
    });
    _userRepository.getCurrentUser().listen((user) async {
      if (state is HomeUpdated) {
        final oldUser = (state as HomeUpdated).user;
        if (oldUser.user.id == user.user.id &&
            oldUser.user.level != user.user.level) {
          _userUpLevelEventController.add(user);
        }
        if (oldUser.user.instrumentId != user.user.instrumentId) {
          final instrument = await _instrumentsRepository.getInstrument(
              user.user.instrumentId);
          MidiProcessor.getInstance().onSelectInstrument(instrument);
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
    _showRateEventController.close();
    return super.close();
  }
}
