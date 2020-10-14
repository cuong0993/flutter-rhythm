import 'dart:async';

import 'package:hitnotes/instrument/instrument.dart';

abstract class InstrumentsRepository {
  Stream<List<Instrument>> instruments();
}
