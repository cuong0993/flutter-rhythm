import 'package:equatable/equatable.dart';
import 'package:hitnotes/instrument/instrument.dart';

abstract class InstrumentsState extends Equatable {
  const InstrumentsState();

  @override
  List<Object> get props => [];
}

class InstrumentsLoading extends InstrumentsState {}

class InstrumentsLoaded extends InstrumentsState {
  final List<Instrument> instruments;

  const InstrumentsLoaded([this.instruments = const []]);

  @override
  List<Object> get props => [instruments];

  @override
  String toString() => 'Loaded { items: $instruments }';
}
