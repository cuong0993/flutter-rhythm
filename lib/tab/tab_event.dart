import 'package:equatable/equatable.dart';

import 'tab_state.dart';

abstract class TabEvent extends Equatable {
  const TabEvent();
}

class UpdateTab extends TabEvent {
  final TabState tabState;

  const UpdateTab(this.tabState);

  @override
  List<Object> get props => [tabState];

  @override
  String toString() => 'UpdateTab { tab: $tabState }';
}
