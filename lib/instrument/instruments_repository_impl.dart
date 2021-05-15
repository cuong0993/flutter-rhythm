import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'instrument.dart';
import 'instruments_repository.dart';

final instrumentRepositoryProvider =
    Provider<InstrumentsRepository>((ref) => InstrumentsRepositoryImpl());

class InstrumentsRepositoryImpl implements InstrumentsRepository {
  @override
  Future<List<Instrument>> instruments() async {
    return (await FirebaseFirestore.instance.collection('instruments').get())
        .docs
        .map((e) => Instrument.fromJson(e.data()))
        .toList();
  }

  @override
  void changeInstrument(String instrumentId) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(<String, dynamic>{'instrumentId': instrumentId});
  }
}
