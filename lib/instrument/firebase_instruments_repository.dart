import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hitnotes/instrument/instrument.dart';

import 'instruments_repository.dart';

class FirebaseInstrumentsRepository implements InstrumentsRepository {
  final _instrumentsCollection =
      FirebaseFirestore.instance.collection('instruments');

  @override
  Stream<List<Instrument>> instruments() {
    return _instrumentsCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Instrument.fromDocumentSnapshot(doc))
          .toList();
    });
  }
}
