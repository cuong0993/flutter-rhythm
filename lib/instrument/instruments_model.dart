import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'instruments_repository.dart';
import 'instruments_repository_impl.dart';
import 'instruments_state.dart';

final instrumentsStateProvider =
    StateNotifierProvider<InstrumentsModel, InstrumentsState>((ref) {
  return InstrumentsModel(ref.read(instrumentRepositoryProvider))
    .._loadInstruments();
});

class InstrumentsModel extends StateNotifier<InstrumentsState> {
  InstrumentsModel(this._instrumentRepository) : super(InstrumentsLoading());

  final InstrumentsRepository _instrumentRepository;

  Future<void> _loadInstruments() async {
    final instruments = await _instrumentRepository.instruments();
    state = InstrumentsUpdated((b) => b..instruments = instruments);
  }
}
