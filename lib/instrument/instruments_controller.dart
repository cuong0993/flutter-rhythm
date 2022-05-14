import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'instrument.dart';
import 'instruments_repository_impl.dart';

final selectedInstrumentIdProvider = StateProvider<String?>((_) => null);

final selectedInstrumentProvider = Provider<Instrument?>((ref) {
  final selectedInstrumentId =
      ref.watch(selectedInstrumentIdProvider.notifier).state;
  final instruments = ref.watch(instrumentsProvider);

  return instruments.when(
    data: (instruments) =>
        instruments.firstWhereOrNull((e) => e.id == selectedInstrumentId),
    loading: () => null,
    error: (_, __) => null,
  );
});

final instrumentsProvider =
    StateNotifierProvider<InstrumentsController, AsyncValue<List<Instrument>>>(
  (ref) => InstrumentsController(ref).._loadInstruments(),
);

class InstrumentsController
    extends StateNotifier<AsyncValue<List<Instrument>>> {
  InstrumentsController(this._read) : super(const AsyncValue.loading());

  final StateNotifierProviderRef _read;

  Future<void> _loadInstruments() async {
    final instruments =
        await _read.read(instrumentRepositoryProvider).instruments();
    state = AsyncValue.data(instruments);
  }
}
