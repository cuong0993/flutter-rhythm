import 'dart:async';

import 'package:bloc/bloc.dart';

import '../instrument/instruments_repository.dart';
import '../midi_processor.dart';
import '../user/user.dart';
import '../user/user_repository.dart';
import 'tab_event.dart';
import 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  final UserRepository _userRepository;
  final InstrumentsRepository _instrumentsRepository;
  Stream<bool> userChangeToPremiumStream;
  Stream<User> userUpLevelStream;

  TabBloc(this._userRepository, this._instrumentsRepository)
      : super(TabState.instruments) {
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
}
