// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instruments_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InstrumentsLoading extends InstrumentsLoading {
  factory _$InstrumentsLoading(
          [void Function(InstrumentsLoadingBuilder)? updates]) =>
      (new InstrumentsLoadingBuilder()..update(updates)).build();

  _$InstrumentsLoading._() : super._();

  @override
  InstrumentsLoading rebuild(
          void Function(InstrumentsLoadingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InstrumentsLoadingBuilder toBuilder() =>
      new InstrumentsLoadingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InstrumentsLoading;
  }

  @override
  int get hashCode {
    return 569944570;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('InstrumentsLoading').toString();
  }
}

class InstrumentsLoadingBuilder
    implements Builder<InstrumentsLoading, InstrumentsLoadingBuilder> {
  _$InstrumentsLoading? _$v;

  InstrumentsLoadingBuilder();

  @override
  void replace(InstrumentsLoading other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InstrumentsLoading;
  }

  @override
  void update(void Function(InstrumentsLoadingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InstrumentsLoading build() {
    final _$result = _$v ?? new _$InstrumentsLoading._();
    replace(_$result);
    return _$result;
  }
}

class _$InstrumentsUpdated extends InstrumentsUpdated {
  @override
  final List<Instrument> instruments;

  factory _$InstrumentsUpdated(
          [void Function(InstrumentsUpdatedBuilder)? updates]) =>
      (new InstrumentsUpdatedBuilder()..update(updates)).build();

  _$InstrumentsUpdated._({required this.instruments}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        instruments, 'InstrumentsUpdated', 'instruments');
  }

  @override
  InstrumentsUpdated rebuild(
          void Function(InstrumentsUpdatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InstrumentsUpdatedBuilder toBuilder() =>
      new InstrumentsUpdatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InstrumentsUpdated && instruments == other.instruments;
  }

  @override
  int get hashCode {
    return $jf($jc(0, instruments.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InstrumentsUpdated')
          ..add('instruments', instruments))
        .toString();
  }
}

class InstrumentsUpdatedBuilder
    implements Builder<InstrumentsUpdated, InstrumentsUpdatedBuilder> {
  _$InstrumentsUpdated? _$v;

  List<Instrument>? _instruments;
  List<Instrument>? get instruments => _$this._instruments;
  set instruments(List<Instrument>? instruments) =>
      _$this._instruments = instruments;

  InstrumentsUpdatedBuilder();

  InstrumentsUpdatedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _instruments = $v.instruments;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InstrumentsUpdated other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InstrumentsUpdated;
  }

  @override
  void update(void Function(InstrumentsUpdatedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InstrumentsUpdated build() {
    final _$result = _$v ??
        new _$InstrumentsUpdated._(
            instruments: BuiltValueNullFieldError.checkNotNull(
                instruments, 'InstrumentsUpdated', 'instruments'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
