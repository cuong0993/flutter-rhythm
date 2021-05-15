import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'instrument.dart';
import 'instruments_repository_impl.dart';
import 'instruments_state.dart';

final selectedInstrumentIdProvider = StateProvider<String?>((_) => null);

final selectedInstrumentProvider = Provider<Instrument?>(((ref) {
  final selectedInstrumentId = ref.watch(selectedInstrumentIdProvider).state;
  final instruments = ref.watch(instrumentsStateProvider).instruments;
  final instrument =
      instruments.firstWhereOrNull((e) => e.id == selectedInstrumentId);
  return instrument;
}));

final instrumentsStateProvider =
    StateNotifierProvider<InstrumentsModel, InstrumentsState>((ref) {
  return InstrumentsModel(ref.read).._loadInstruments();
});

class InstrumentsModel extends StateNotifier<InstrumentsState> {
  InstrumentsModel(this._read)
      : super(InstrumentsState((b) => b..instruments = []));

  final Reader _read;

  Future<void> _loadInstruments() async {
    final instruments = await _read(instrumentRepositoryProvider).instruments();
    state = state.rebuild((b) => b..instruments = instruments);
  }
}
