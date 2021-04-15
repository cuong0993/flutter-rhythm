// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Uninitialized extends Uninitialized {
  factory _$Uninitialized([void Function(UninitializedBuilder)? updates]) =>
      (new UninitializedBuilder()..update(updates)).build();

  _$Uninitialized._() : super._();

  @override
  Uninitialized rebuild(void Function(UninitializedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UninitializedBuilder toBuilder() => new UninitializedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Uninitialized;
  }

  @override
  int get hashCode {
    return 940951495;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('Uninitialized').toString();
  }
}

class UninitializedBuilder
    implements Builder<Uninitialized, UninitializedBuilder> {
  _$Uninitialized? _$v;

  UninitializedBuilder();

  @override
  void replace(Uninitialized other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Uninitialized;
  }

  @override
  void update(void Function(UninitializedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Uninitialized build() {
    final _$result = _$v ?? new _$Uninitialized._();
    replace(_$result);
    return _$result;
  }
}

class _$Authenticated extends Authenticated {
  @override
  final String type;

  factory _$Authenticated([void Function(AuthenticatedBuilder)? updates]) =>
      (new AuthenticatedBuilder()..update(updates)).build();

  _$Authenticated._({required this.type}) : super._() {
    BuiltValueNullFieldError.checkNotNull(type, 'Authenticated', 'type');
  }

  @override
  Authenticated rebuild(void Function(AuthenticatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthenticatedBuilder toBuilder() => new AuthenticatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Authenticated && type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc(0, type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Authenticated')..add('type', type))
        .toString();
  }
}

class AuthenticatedBuilder
    implements Builder<Authenticated, AuthenticatedBuilder> {
  _$Authenticated? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  AuthenticatedBuilder();

  AuthenticatedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Authenticated other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Authenticated;
  }

  @override
  void update(void Function(AuthenticatedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Authenticated build() {
    final _$result = _$v ??
        new _$Authenticated._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, 'Authenticated', 'type'));
    replace(_$result);
    return _$result;
  }
}

class _$Unauthenticated extends Unauthenticated {
  factory _$Unauthenticated([void Function(UnauthenticatedBuilder)? updates]) =>
      (new UnauthenticatedBuilder()..update(updates)).build();

  _$Unauthenticated._() : super._();

  @override
  Unauthenticated rebuild(void Function(UnauthenticatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnauthenticatedBuilder toBuilder() =>
      new UnauthenticatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Unauthenticated;
  }

  @override
  int get hashCode {
    return 685811249;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('Unauthenticated').toString();
  }
}

class UnauthenticatedBuilder
    implements Builder<Unauthenticated, UnauthenticatedBuilder> {
  _$Unauthenticated? _$v;

  UnauthenticatedBuilder();

  @override
  void replace(Unauthenticated other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Unauthenticated;
  }

  @override
  void update(void Function(UnauthenticatedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Unauthenticated build() {
    final _$result = _$v ?? new _$Unauthenticated._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
