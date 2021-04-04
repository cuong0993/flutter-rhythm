import 'dart:async';

import 'instrument.dart';

// ignore: one_member_abstracts
abstract class InstrumentsRepository {
  Future<List<Instrument>> instruments();
}
