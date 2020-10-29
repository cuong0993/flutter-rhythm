import 'dart:async';

import 'package:bloc/bloc.dart';

import '../instrument/instruments_repository.dart';
import '../midi_processor.dart';
import '../preferences.dart';
import '../user/user.dart';
import '../user/user_repository.dart';
import 'tab_event.dart';
import 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  final UserRepository _userRepository;
  final InstrumentsRepository _instrumentsRepository;
  Stream<bool> userChangeToPremiumStream;
  Stream<User> userUpLevelStream;
  final _showRateEventController = StreamController<bool>();

  Stream<bool> get showRateEventStream => _showRateEventController.stream;

  TabBloc(this._userRepository, this._instrumentsRepository)
      : super(TabState.instruments) {
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
    userChangeToPremiumStream = _userRepository
        .getUser()
        .map((user) => user.free)
        .distinct()
        .where((free) => !free)
        .skip(1);
    userUpLevelStream = _userRepository
        .getUser()
        .distinct((prev, next) => prev.level == next.level)
        .skip(1);
    _userRepository
        .getUser()
        .map((user) => user.instrumentId)
        .distinct()
        .listen((id) async {
      final instrument = await _instrumentsRepository.getInstrument(id);
      MidiProcessor.getInstance().onSelectInstrument(instrument);
    });
  }

  @override
  Stream<TabState> mapEventToState(TabEvent event) async* {
    if (event is UpdateTab) {
      yield event.tabState;
    }
  }

  @override
  Future<void> close() {
    _showRateEventController.close();
    return super.close();
  }
}
