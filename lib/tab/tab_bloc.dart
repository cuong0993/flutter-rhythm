import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../user/user_repository.dart';
import 'tab_event.dart';
import 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  final UserRepository _userRepository;
  StreamSubscription _userSubscription;

  TabBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(TabState.instruments) {
    _userSubscription = _userRepository.getUser().listen(
    (user) => _controller.add(true)
    );
  }

  final _controller = StreamController<bool>();
  Stream<bool> get loginRewardStream => _controller.stream;

  @override
  Stream<TabState> mapEventToState(TabEvent event) async* {
    if (event is UpdateTab) {
      yield event.tabState;
    }
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    _controller.close();
    return super.close();
  }
}
