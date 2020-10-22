import 'dart:async';

import 'instrument.dart';

abstract class InstrumentsRepository {
  Stream<List<Instrument>> instruments();

  Future<Instrument> getInstrument(String id);
}
