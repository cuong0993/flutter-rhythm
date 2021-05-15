// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'authentication_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthenticationStateTearOff {
  const _$AuthenticationStateTearOff();

  AuthenticationStateLoading loading() {
    return AuthenticationStateLoading();
  }

  AuthenticationStateAnonymousAuthenticated anonymousAuthenticated() {
    return AuthenticationStateAnonymousAuthenticated();
  }

  AuthenticationStateGoogleAuthenticated googleAuthenticated() {
    return AuthenticationStateGoogleAuthenticated();
  }

  AuthenticationStateFacebookAuthenticated facebookAuthenticated() {
    return AuthenticationStateFacebookAuthenticated();
  }

  AuthenticationStateUnauthenticated unauthenticated() {
    return AuthenticationStateUnauthenticated();
  }
}

/// @nodoc
const $AuthenticationState = _$AuthenticationStateTearOff();

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() anonymousAuthenticated,
    required TResult Function() googleAuthenticated,
    required TResult Function() facebookAuthenticated,
    required TResult Function() unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? anonymousAuthenticated,
    TResult Function()? googleAuthenticated,
    TResult Function()? facebookAuthenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationStateLoading value) loading,
    required TResult Function(AuthenticationStateAnonymousAuthenticated value)
        anonymousAuthenticated,
    required TResult Function(AuthenticationStateGoogleAuthenticated value)
        googleAuthenticated,
    required TResult Function(AuthenticationStateFacebookAuthenticated value)
        facebookAuthenticated,
    required TResult Function(AuthenticationStateUnauthenticated value)
        unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStateLoading value)? loading,
    TResult Function(AuthenticationStateAnonymousAuthenticated value)?
        anonymousAuthenticated,
    TResult Function(AuthenticationStateGoogleAuthenticated value)?
        googleAuthenticated,
    TResult Function(AuthenticationStateFacebookAuthenticated value)?
        facebookAuthenticated,
    TResult Function(AuthenticationStateUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  final AuthenticationState _value;
  // ignore: unused_field
  final $Res Function(AuthenticationState) _then;
}

/// @nodoc
abstract class $AuthenticationStateLoadingCopyWith<$Res> {
  factory $AuthenticationStateLoadingCopyWith(AuthenticationStateLoading value,
          $Res Function(AuthenticationStateLoading) then) =
      _$AuthenticationStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationStateLoadingCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateLoadingCopyWith<$Res> {
  _$AuthenticationStateLoadingCopyWithImpl(AuthenticationStateLoading _value,
      $Res Function(AuthenticationStateLoading) _then)
      : super(_value, (v) => _then(v as AuthenticationStateLoading));

  @override
  AuthenticationStateLoading get _value =>
      super._value as AuthenticationStateLoading;
}

/// @nodoc

class _$AuthenticationStateLoading implements AuthenticationStateLoading {
  _$AuthenticationStateLoading();

  @override
  String toString() {
    return 'AuthenticationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthenticationStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() anonymousAuthenticated,
    required TResult Function() googleAuthenticated,
    required TResult Function() facebookAuthenticated,
    required TResult Function() unauthenticated,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? anonymousAuthenticated,
    TResult Function()? googleAuthenticated,
    TResult Function()? facebookAuthenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationStateLoading value) loading,
    required TResult Function(AuthenticationStateAnonymousAuthenticated value)
        anonymousAuthenticated,
    required TResult Function(AuthenticationStateGoogleAuthenticated value)
        googleAuthenticated,
    required TResult Function(AuthenticationStateFacebookAuthenticated value)
        facebookAuthenticated,
    required TResult Function(AuthenticationStateUnauthenticated value)
        unauthenticated,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStateLoading value)? loading,
    TResult Function(AuthenticationStateAnonymousAuthenticated value)?
        anonymousAuthenticated,
    TResult Function(AuthenticationStateGoogleAuthenticated value)?
        googleAuthenticated,
    TResult Function(AuthenticationStateFacebookAuthenticated value)?
        facebookAuthenticated,
    TResult Function(AuthenticationStateUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthenticationStateLoading implements AuthenticationState {
  factory AuthenticationStateLoading() = _$AuthenticationStateLoading;
}

/// @nodoc
abstract class $AuthenticationStateAnonymousAuthenticatedCopyWith<$Res> {
  factory $AuthenticationStateAnonymousAuthenticatedCopyWith(
          AuthenticationStateAnonymousAuthenticated value,
          $Res Function(AuthenticationStateAnonymousAuthenticated) then) =
      _$AuthenticationStateAnonymousAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationStateAnonymousAuthenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateAnonymousAuthenticatedCopyWith<$Res> {
  _$AuthenticationStateAnonymousAuthenticatedCopyWithImpl(
      AuthenticationStateAnonymousAuthenticated _value,
      $Res Function(AuthenticationStateAnonymousAuthenticated) _then)
      : super(_value,
            (v) => _then(v as AuthenticationStateAnonymousAuthenticated));

  @override
  AuthenticationStateAnonymousAuthenticated get _value =>
      super._value as AuthenticationStateAnonymousAuthenticated;
}

/// @nodoc

class _$AuthenticationStateAnonymousAuthenticated
    implements AuthenticationStateAnonymousAuthenticated {
  _$AuthenticationStateAnonymousAuthenticated();

  @override
  String toString() {
    return 'AuthenticationState.anonymousAuthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthenticationStateAnonymousAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() anonymousAuthenticated,
    required TResult Function() googleAuthenticated,
    required TResult Function() facebookAuthenticated,
    required TResult Function() unauthenticated,
  }) {
    return anonymousAuthenticated();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? anonymousAuthenticated,
    TResult Function()? googleAuthenticated,
    TResult Function()? facebookAuthenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (anonymousAuthenticated != null) {
      return anonymousAuthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationStateLoading value) loading,
    required TResult Function(AuthenticationStateAnonymousAuthenticated value)
        anonymousAuthenticated,
    required TResult Function(AuthenticationStateGoogleAuthenticated value)
        googleAuthenticated,
    required TResult Function(AuthenticationStateFacebookAuthenticated value)
        facebookAuthenticated,
    required TResult Function(AuthenticationStateUnauthenticated value)
        unauthenticated,
  }) {
    return anonymousAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStateLoading value)? loading,
    TResult Function(AuthenticationStateAnonymousAuthenticated value)?
        anonymousAuthenticated,
    TResult Function(AuthenticationStateGoogleAuthenticated value)?
        googleAuthenticated,
    TResult Function(AuthenticationStateFacebookAuthenticated value)?
        facebookAuthenticated,
    TResult Function(AuthenticationStateUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (anonymousAuthenticated != null) {
      return anonymousAuthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthenticationStateAnonymousAuthenticated
    implements AuthenticationState {
  factory AuthenticationStateAnonymousAuthenticated() =
      _$AuthenticationStateAnonymousAuthenticated;
}

/// @nodoc
abstract class $AuthenticationStateGoogleAuthenticatedCopyWith<$Res> {
  factory $AuthenticationStateGoogleAuthenticatedCopyWith(
          AuthenticationStateGoogleAuthenticated value,
          $Res Function(AuthenticationStateGoogleAuthenticated) then) =
      _$AuthenticationStateGoogleAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationStateGoogleAuthenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateGoogleAuthenticatedCopyWith<$Res> {
  _$AuthenticationStateGoogleAuthenticatedCopyWithImpl(
      AuthenticationStateGoogleAuthenticated _value,
      $Res Function(AuthenticationStateGoogleAuthenticated) _then)
      : super(
            _value, (v) => _then(v as AuthenticationStateGoogleAuthenticated));

  @override
  AuthenticationStateGoogleAuthenticated get _value =>
      super._value as AuthenticationStateGoogleAuthenticated;
}

/// @nodoc

class _$AuthenticationStateGoogleAuthenticated
    implements AuthenticationStateGoogleAuthenticated {
  _$AuthenticationStateGoogleAuthenticated();

  @override
  String toString() {
    return 'AuthenticationState.googleAuthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthenticationStateGoogleAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() anonymousAuthenticated,
    required TResult Function() googleAuthenticated,
    required TResult Function() facebookAuthenticated,
    required TResult Function() unauthenticated,
  }) {
    return googleAuthenticated();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? anonymousAuthenticated,
    TResult Function()? googleAuthenticated,
    TResult Function()? facebookAuthenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (googleAuthenticated != null) {
      return googleAuthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationStateLoading value) loading,
    required TResult Function(AuthenticationStateAnonymousAuthenticated value)
        anonymousAuthenticated,
    required TResult Function(AuthenticationStateGoogleAuthenticated value)
        googleAuthenticated,
    required TResult Function(AuthenticationStateFacebookAuthenticated value)
        facebookAuthenticated,
    required TResult Function(AuthenticationStateUnauthenticated value)
        unauthenticated,
  }) {
    return googleAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStateLoading value)? loading,
    TResult Function(AuthenticationStateAnonymousAuthenticated value)?
        anonymousAuthenticated,
    TResult Function(AuthenticationStateGoogleAuthenticated value)?
        googleAuthenticated,
    TResult Function(AuthenticationStateFacebookAuthenticated value)?
        facebookAuthenticated,
    TResult Function(AuthenticationStateUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (googleAuthenticated != null) {
      return googleAuthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthenticationStateGoogleAuthenticated
    implements AuthenticationState {
  factory AuthenticationStateGoogleAuthenticated() =
      _$AuthenticationStateGoogleAuthenticated;
}

/// @nodoc
abstract class $AuthenticationStateFacebookAuthenticatedCopyWith<$Res> {
  factory $AuthenticationStateFacebookAuthenticatedCopyWith(
          AuthenticationStateFacebookAuthenticated value,
          $Res Function(AuthenticationStateFacebookAuthenticated) then) =
      _$AuthenticationStateFacebookAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationStateFacebookAuthenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateFacebookAuthenticatedCopyWith<$Res> {
  _$AuthenticationStateFacebookAuthenticatedCopyWithImpl(
      AuthenticationStateFacebookAuthenticated _value,
      $Res Function(AuthenticationStateFacebookAuthenticated) _then)
      : super(_value,
            (v) => _then(v as AuthenticationStateFacebookAuthenticated));

  @override
  AuthenticationStateFacebookAuthenticated get _value =>
      super._value as AuthenticationStateFacebookAuthenticated;
}

/// @nodoc

class _$AuthenticationStateFacebookAuthenticated
    implements AuthenticationStateFacebookAuthenticated {
  _$AuthenticationStateFacebookAuthenticated();

  @override
  String toString() {
    return 'AuthenticationState.facebookAuthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthenticationStateFacebookAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() anonymousAuthenticated,
    required TResult Function() googleAuthenticated,
    required TResult Function() facebookAuthenticated,
    required TResult Function() unauthenticated,
  }) {
    return facebookAuthenticated();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? anonymousAuthenticated,
    TResult Function()? googleAuthenticated,
    TResult Function()? facebookAuthenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (facebookAuthenticated != null) {
      return facebookAuthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationStateLoading value) loading,
    required TResult Function(AuthenticationStateAnonymousAuthenticated value)
        anonymousAuthenticated,
    required TResult Function(AuthenticationStateGoogleAuthenticated value)
        googleAuthenticated,
    required TResult Function(AuthenticationStateFacebookAuthenticated value)
        facebookAuthenticated,
    required TResult Function(AuthenticationStateUnauthenticated value)
        unauthenticated,
  }) {
    return facebookAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStateLoading value)? loading,
    TResult Function(AuthenticationStateAnonymousAuthenticated value)?
        anonymousAuthenticated,
    TResult Function(AuthenticationStateGoogleAuthenticated value)?
        googleAuthenticated,
    TResult Function(AuthenticationStateFacebookAuthenticated value)?
        facebookAuthenticated,
    TResult Function(AuthenticationStateUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (facebookAuthenticated != null) {
      return facebookAuthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthenticationStateFacebookAuthenticated
    implements AuthenticationState {
  factory AuthenticationStateFacebookAuthenticated() =
      _$AuthenticationStateFacebookAuthenticated;
}

/// @nodoc
abstract class $AuthenticationStateUnauthenticatedCopyWith<$Res> {
  factory $AuthenticationStateUnauthenticatedCopyWith(
          AuthenticationStateUnauthenticated value,
          $Res Function(AuthenticationStateUnauthenticated) then) =
      _$AuthenticationStateUnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationStateUnauthenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateUnauthenticatedCopyWith<$Res> {
  _$AuthenticationStateUnauthenticatedCopyWithImpl(
      AuthenticationStateUnauthenticated _value,
      $Res Function(AuthenticationStateUnauthenticated) _then)
      : super(_value, (v) => _then(v as AuthenticationStateUnauthenticated));

  @override
  AuthenticationStateUnauthenticated get _value =>
      super._value as AuthenticationStateUnauthenticated;
}

/// @nodoc

class _$AuthenticationStateUnauthenticated
    implements AuthenticationStateUnauthenticated {
  _$AuthenticationStateUnauthenticated();

  @override
  String toString() {
    return 'AuthenticationState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthenticationStateUnauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() anonymousAuthenticated,
    required TResult Function() googleAuthenticated,
    required TResult Function() facebookAuthenticated,
    required TResult Function() unauthenticated,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? anonymousAuthenticated,
    TResult Function()? googleAuthenticated,
    TResult Function()? facebookAuthenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationStateLoading value) loading,
    required TResult Function(AuthenticationStateAnonymousAuthenticated value)
        anonymousAuthenticated,
    required TResult Function(AuthenticationStateGoogleAuthenticated value)
        googleAuthenticated,
    required TResult Function(AuthenticationStateFacebookAuthenticated value)
        facebookAuthenticated,
    required TResult Function(AuthenticationStateUnauthenticated value)
        unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStateLoading value)? loading,
    TResult Function(AuthenticationStateAnonymousAuthenticated value)?
        anonymousAuthenticated,
    TResult Function(AuthenticationStateGoogleAuthenticated value)?
        googleAuthenticated,
    TResult Function(AuthenticationStateFacebookAuthenticated value)?
        facebookAuthenticated,
    TResult Function(AuthenticationStateUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthenticationStateUnauthenticated
    implements AuthenticationState {
  factory AuthenticationStateUnauthenticated() =
      _$AuthenticationStateUnauthenticated;
}
