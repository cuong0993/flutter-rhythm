import 'dart:async';

import 'instrument.dart';

abstract class InstrumentsRepository {
  Future<List<Instrument>> instruments();

  void changeInstrument(String instrumentId);
}
