import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'instruments_event.dart';
import 'instruments_repository.dart';
import 'instruments_state.dart';

class InstrumentsBloc extends Bloc<InstrumentsEvent, InstrumentsState> {
  final InstrumentsRepository _instrumentsRepository;
  StreamSubscription _instrumentsSubscription;

  InstrumentsBloc({@required InstrumentsRepository instrumentsRepository})
      : assert(instrumentsRepository != null),
        _instrumentsRepository = instrumentsRepository,
        super(InstrumentsLoading());

  @override
  Stream<InstrumentsState> mapEventToState(InstrumentsEvent event) async* {
    if (event is LoadInstruments) {
      yield* _mapLoadInstrumentsToState();
    }
    if (event is UpdateInstruments) {
      yield InstrumentsLoaded(event.instruments);
    }
  }

  Stream<InstrumentsState> _mapLoadInstrumentsToState() async* {
    await _instrumentsSubscription?.cancel();
    _instrumentsSubscription = _instrumentsRepository.instruments().listen(
          (instruments) => add(UpdateInstruments(instruments)),
        );
  }

  @override
  Future<void> close() {
    _instrumentsSubscription?.cancel();
    return super.close();
  }
}
