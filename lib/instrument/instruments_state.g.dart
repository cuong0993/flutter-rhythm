// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instruments_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InstrumentsState extends InstrumentsState {
  @override
  final List<Instrument> instruments;
  @override
  final String? selectedInstrumentId;

  factory _$InstrumentsState(
          [void Function(InstrumentsStateBuilder)? updates]) =>
      (new InstrumentsStateBuilder()..update(updates)).build();

  _$InstrumentsState._({required this.instruments, this.selectedInstrumentId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        instruments, 'InstrumentsState', 'instruments');
  }

  @override
  InstrumentsState rebuild(void Function(InstrumentsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InstrumentsStateBuilder toBuilder() =>
      new InstrumentsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InstrumentsState &&
        instruments == other.instruments &&
        selectedInstrumentId == other.selectedInstrumentId;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, instruments.hashCode), selectedInstrumentId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InstrumentsState')
          ..add('instruments', instruments)
          ..add('selectedInstrumentId', selectedInstrumentId))
        .toString();
  }
}

class InstrumentsStateBuilder
    implements Builder<InstrumentsState, InstrumentsStateBuilder> {
  _$InstrumentsState? _$v;

  List<Instrument>? _instruments;
  List<Instrument>? get instruments => _$this._instruments;
  set instruments(List<Instrument>? instruments) =>
      _$this._instruments = instruments;

  String? _selectedInstrumentId;
  String? get selectedInstrumentId => _$this._selectedInstrumentId;
  set selectedInstrumentId(String? selectedInstrumentId) =>
      _$this._selectedInstrumentId = selectedInstrumentId;

  InstrumentsStateBuilder();

  InstrumentsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _instruments = $v.instruments;
      _selectedInstrumentId = $v.selectedInstrumentId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InstrumentsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InstrumentsState;
  }

  @override
  void update(void Function(InstrumentsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InstrumentsState build() {
    final _$result = _$v ??
        new _$InstrumentsState._(
            instruments: BuiltValueNullFieldError.checkNotNull(
                instruments, 'InstrumentsState', 'instruments'),
            selectedInstrumentId: selectedInstrumentId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
