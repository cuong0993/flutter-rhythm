import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'instrument.dart';
import 'instruments_repository.dart';

class InstrumentsRepositoryImpl implements InstrumentsRepository {
  @override
  Stream<List<Instrument>> instruments() {
    return FirebaseFirestore.instance
        .collection('instruments')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Instrument.fromJson(doc.data()))
          .toList();
    });
  }

  @override
  Future<Instrument> getInstrument(String id) {
    return FirebaseFirestore.instance
        .collection('instruments')
        .doc(id)
        .get()
        .then((value) => Instrument.fromJson(value.data()));
  }
}
