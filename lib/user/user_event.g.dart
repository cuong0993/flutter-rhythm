// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateUser extends UpdateUser {
  @override
  final AppUser user;
  @override
  final List<Instrument> instruments;

  factory _$UpdateUser([void Function(UpdateUserBuilder)? updates]) =>
      (new UpdateUserBuilder()..update(updates)).build();

  _$UpdateUser._({required this.user, required this.instruments}) : super._() {
    BuiltValueNullFieldError.checkNotNull(user, 'UpdateUser', 'user');
    BuiltValueNullFieldError.checkNotNull(
        instruments, 'UpdateUser', 'instruments');
  }

  @override
  UpdateUser rebuild(void Function(UpdateUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateUserBuilder toBuilder() => new UpdateUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateUser &&
        user == other.user &&
        instruments == other.instruments;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, user.hashCode), instruments.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UpdateUser')
          ..add('user', user)
          ..add('instruments', instruments))
        .toString();
  }
}

class UpdateUserBuilder implements Builder<UpdateUser, UpdateUserBuilder> {
  _$UpdateUser? _$v;

  AppUser? _user;
  AppUser? get user => _$this._user;
  set user(AppUser? user) => _$this._user = user;

  List<Instrument>? _instruments;
  List<Instrument>? get instruments => _$this._instruments;
  set instruments(List<Instrument>? instruments) =>
      _$this._instruments = instruments;

  UpdateUserBuilder();

  UpdateUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _instruments = $v.instruments;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateUser;
  }

  @override
  void update(void Function(UpdateUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UpdateUser build() {
    final _$result = _$v ??
        new _$UpdateUser._(
            user: BuiltValueNullFieldError.checkNotNull(
                user, 'UpdateUser', 'user'),
            instruments: BuiltValueNullFieldError.checkNotNull(
                instruments, 'UpdateUser', 'instruments'));
    replace(_$result);
    return _$result;
  }
}

class _$ChangeInstrument extends ChangeInstrument {
  @override
  final String instrumentId;

  factory _$ChangeInstrument(
          [void Function(ChangeInstrumentBuilder)? updates]) =>
      (new ChangeInstrumentBuilder()..update(updates)).build();

  _$ChangeInstrument._({required this.instrumentId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        instrumentId, 'ChangeInstrument', 'instrumentId');
  }

  @override
  ChangeInstrument rebuild(void Function(ChangeInstrumentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeInstrumentBuilder toBuilder() =>
      new ChangeInstrumentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeInstrument && instrumentId == other.instrumentId;
  }

  @override
  int get hashCode {
    return $jf($jc(0, instrumentId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChangeInstrument')
          ..add('instrumentId', instrumentId))
        .toString();
  }
}

class ChangeInstrumentBuilder
    implements Builder<ChangeInstrument, ChangeInstrumentBuilder> {
  _$ChangeInstrument? _$v;

  String? _instrumentId;
  String? get instrumentId => _$this._instrumentId;
  set instrumentId(String? instrumentId) => _$this._instrumentId = instrumentId;

  ChangeInstrumentBuilder();

  ChangeInstrumentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _instrumentId = $v.instrumentId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeInstrument other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeInstrument;
  }

  @override
  void update(void Function(ChangeInstrumentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChangeInstrument build() {
    final _$result = _$v ??
        new _$ChangeInstrument._(
            instrumentId: BuiltValueNullFieldError.checkNotNull(
                instrumentId, 'ChangeInstrument', 'instrumentId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
