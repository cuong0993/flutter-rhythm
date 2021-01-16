import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'instrument.dart';
import 'instruments_repository.dart';

class InstrumentsRepositoryImpl implements InstrumentsRepository {
  @override
  Future<List<Instrument>> instruments() async {
    return (await FirebaseFirestore.instance.collection('instruments').get())
        .docs
        .map((e) => Instrument.fromJson(e.data()))
        .toList();
  }
}
