import 'package:built_value/built_value.dart';

import 'instrument.dart';

part 'instruments_state.g.dart';

abstract class InstrumentsState
    implements Built<InstrumentsState, InstrumentsStateBuilder> {
  factory InstrumentsState([Function(InstrumentsStateBuilder) updates]) =
      _$InstrumentsState;

  InstrumentsState._();

  List<Instrument> get instruments;

  String? get selectedInstrumentId;
}
