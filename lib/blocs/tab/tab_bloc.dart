import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hitnotes/blocs/tab/tab_event.dart';
import 'package:hitnotes/models/models.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  TabBloc() : super(AppTab.todos);

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is UpdateTab) {
      yield event.tab;
    }
  }
}
