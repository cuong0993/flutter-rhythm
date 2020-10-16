import 'dart:async';

import 'package:bloc/bloc.dart';

import 'tab_event.dart';
import 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(TabState.instruments);

  @override
  Stream<TabState> mapEventToState(TabEvent event) async* {
    if (event is UpdateTab) {
      yield event.tabState;
    }
  }
}
