// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChangeLocaleEvent extends ChangeLocaleEvent {
  @override
  final Locale locale;

  factory _$ChangeLocaleEvent(
          [void Function(ChangeLocaleEventBuilder)? updates]) =>
      (new ChangeLocaleEventBuilder()..update(updates)).build();

  _$ChangeLocaleEvent._({required this.locale}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        locale, 'ChangeLocaleEvent', 'locale');
  }

  @override
  ChangeLocaleEvent rebuild(void Function(ChangeLocaleEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeLocaleEventBuilder toBuilder() =>
      new ChangeLocaleEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeLocaleEvent && locale == other.locale;
  }

  @override
  int get hashCode {
    return $jf($jc(0, locale.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChangeLocaleEvent')
          ..add('locale', locale))
        .toString();
  }
}

class ChangeLocaleEventBuilder
    implements Builder<ChangeLocaleEvent, ChangeLocaleEventBuilder> {
  _$ChangeLocaleEvent? _$v;

  Locale? _locale;
  Locale? get locale => _$this._locale;
  set locale(Locale? locale) => _$this._locale = locale;

  ChangeLocaleEventBuilder();

  ChangeLocaleEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _locale = $v.locale;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeLocaleEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeLocaleEvent;
  }

  @override
  void update(void Function(ChangeLocaleEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChangeLocaleEvent build() {
    final _$result = _$v ??
        new _$ChangeLocaleEvent._(
            locale: BuiltValueNullFieldError.checkNotNull(
                locale, 'ChangeLocaleEvent', 'locale'));
    replace(_$result);
    return _$result;
  }
}

class _$ChangeThemeEvent extends ChangeThemeEvent {
  @override
  final String themeName;

  factory _$ChangeThemeEvent(
          [void Function(ChangeThemeEventBuilder)? updates]) =>
      (new ChangeThemeEventBuilder()..update(updates)).build();

  _$ChangeThemeEvent._({required this.themeName}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        themeName, 'ChangeThemeEvent', 'themeName');
  }

  @override
  ChangeThemeEvent rebuild(void Function(ChangeThemeEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeThemeEventBuilder toBuilder() =>
      new ChangeThemeEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeThemeEvent && themeName == other.themeName;
  }

  @override
  int get hashCode {
    return $jf($jc(0, themeName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChangeThemeEvent')
          ..add('themeName', themeName))
        .toString();
  }
}

class ChangeThemeEventBuilder
    implements Builder<ChangeThemeEvent, ChangeThemeEventBuilder> {
  _$ChangeThemeEvent? _$v;

  String? _themeName;
  String? get themeName => _$this._themeName;
  set themeName(String? themeName) => _$this._themeName = themeName;

  ChangeThemeEventBuilder();

  ChangeThemeEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _themeName = $v.themeName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeThemeEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeThemeEvent;
  }

  @override
  void update(void Function(ChangeThemeEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChangeThemeEvent build() {
    final _$result = _$v ??
        new _$ChangeThemeEvent._(
            themeName: BuiltValueNullFieldError.checkNotNull(
                themeName, 'ChangeThemeEvent', 'themeName'));
    replace(_$result);
    return _$result;
  }
}

class _$LoadThemeAndLocaleEvent extends LoadThemeAndLocaleEvent {
  @override
  final String? themeName;
  @override
  final Locale? locale;

  factory _$LoadThemeAndLocaleEvent(
          [void Function(LoadThemeAndLocaleEventBuilder)? updates]) =>
      (new LoadThemeAndLocaleEventBuilder()..update(updates)).build();

  _$LoadThemeAndLocaleEvent._({this.themeName, this.locale}) : super._();

  @override
  LoadThemeAndLocaleEvent rebuild(
          void Function(LoadThemeAndLocaleEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoadThemeAndLocaleEventBuilder toBuilder() =>
      new LoadThemeAndLocaleEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoadThemeAndLocaleEvent &&
        themeName == other.themeName &&
        locale == other.locale;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, themeName.hashCode), locale.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoadThemeAndLocaleEvent')
          ..add('themeName', themeName)
          ..add('locale', locale))
        .toString();
  }
}

class LoadThemeAndLocaleEventBuilder
    implements
        Builder<LoadThemeAndLocaleEvent, LoadThemeAndLocaleEventBuilder> {
  _$LoadThemeAndLocaleEvent? _$v;

  String? _themeName;
  String? get themeName => _$this._themeName;
  set themeName(String? themeName) => _$this._themeName = themeName;

  Locale? _locale;
  Locale? get locale => _$this._locale;
  set locale(Locale? locale) => _$this._locale = locale;

  LoadThemeAndLocaleEventBuilder();

  LoadThemeAndLocaleEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _themeName = $v.themeName;
      _locale = $v.locale;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoadThemeAndLocaleEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoadThemeAndLocaleEvent;
  }

  @override
  void update(void Function(LoadThemeAndLocaleEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoadThemeAndLocaleEvent build() {
    final _$result = _$v ??
        new _$LoadThemeAndLocaleEvent._(themeName: themeName, locale: locale);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
