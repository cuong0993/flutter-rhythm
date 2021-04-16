import 'package:built_value/built_value.dart';

import 'instrument.dart';

part 'instruments_state.g.dart';

abstract class InstrumentsState {}

abstract class InstrumentsLoading
    implements
        Built<InstrumentsLoading, InstrumentsLoadingBuilder>,
        InstrumentsState {
  factory InstrumentsLoading([Function(InstrumentsLoadingBuilder) updates]) =
      _$InstrumentsLoading;

  InstrumentsLoading._();
}

abstract class InstrumentsUpdated
    implements
        Built<InstrumentsUpdated, InstrumentsUpdatedBuilder>,
        InstrumentsState {
  factory InstrumentsUpdated([Function(InstrumentsUpdatedBuilder) updates]) =
      _$InstrumentsUpdated;

  InstrumentsUpdated._();

  List<Instrument> get instruments;
}
