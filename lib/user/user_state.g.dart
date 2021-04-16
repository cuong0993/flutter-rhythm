// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserLoading extends UserLoading {
  factory _$UserLoading([void Function(UserLoadingBuilder)? updates]) =>
      (new UserLoadingBuilder()..update(updates)).build();

  _$UserLoading._() : super._();

  @override
  UserLoading rebuild(void Function(UserLoadingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserLoadingBuilder toBuilder() => new UserLoadingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserLoading;
  }

  @override
  int get hashCode {
    return 861765406;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('UserLoading').toString();
  }
}

class UserLoadingBuilder implements Builder<UserLoading, UserLoadingBuilder> {
  _$UserLoading? _$v;

  UserLoadingBuilder();

  @override
  void replace(UserLoading other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserLoading;
  }

  @override
  void update(void Function(UserLoadingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserLoading build() {
    final _$result = _$v ?? new _$UserLoading._();
    replace(_$result);
    return _$result;
  }
}

class _$UserUpdated extends UserUpdated {
  @override
  final AppUser user;

  factory _$UserUpdated([void Function(UserUpdatedBuilder)? updates]) =>
      (new UserUpdatedBuilder()..update(updates)).build();

  _$UserUpdated._({required this.user}) : super._() {
    BuiltValueNullFieldError.checkNotNull(user, 'UserUpdated', 'user');
  }

  @override
  UserUpdated rebuild(void Function(UserUpdatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserUpdatedBuilder toBuilder() => new UserUpdatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserUpdated && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserUpdated')..add('user', user))
        .toString();
  }
}

class UserUpdatedBuilder implements Builder<UserUpdated, UserUpdatedBuilder> {
  _$UserUpdated? _$v;

  AppUser? _user;
  AppUser? get user => _$this._user;
  set user(AppUser? user) => _$this._user = user;

  UserUpdatedBuilder();

  UserUpdatedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserUpdated other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserUpdated;
  }

  @override
  void update(void Function(UserUpdatedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserUpdated build() {
    final _$result = _$v ??
        new _$UserUpdated._(
            user: BuiltValueNullFieldError.checkNotNull(
                user, 'UserUpdated', 'user'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
