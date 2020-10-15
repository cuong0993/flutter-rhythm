import 'package:equatable/equatable.dart';

import 'instrument.dart';

abstract class InstrumentsEvent extends Equatable {
  const InstrumentsEvent();

  @override
  List<Object> get props => [];
}

class LoadInstruments extends InstrumentsEvent {}

class UpdateInstruments extends InstrumentsEvent {
  final List<Instrument> instruments;

  const UpdateInstruments(this.instruments);

  @override
  List<Object> get props => [instruments];
}
