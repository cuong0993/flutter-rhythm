import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../midi/midi_model.dart';
import '../user/user_repository_impl.dart';
import 'instruments_repository_impl.dart';
import 'instruments_state.dart';

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
    if (state.instruments.isEmpty && state.selectedInstrumentId != null) {
      final instrument = instruments.firstWhere(
          (instrument) => instrument.id == state.selectedInstrumentId);
      _read(midiProvider.notifier).changeInstrument(instrument);
    }
    state = state.rebuild((b) => b..instruments = instruments);
  }

  void selectInstrument(String instrumentId, {bool isFromServer = false}) {
    if (state.instruments.isNotEmpty) {
      final instrument = state.instruments
          .firstWhere((instrument) => instrument.id == instrumentId);
      _read(midiProvider.notifier).changeInstrument(instrument);
    }
    if (!isFromServer) {
      _read(userRepositoryProvider).changeInstrument(instrumentId);
    }
    state = state.rebuild((b) => b..selectedInstrumentId = instrumentId);
  }
}
