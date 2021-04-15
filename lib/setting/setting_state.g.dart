// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SettingState extends SettingState {
  @override
  final Locale? locale;
  @override
  final String? themeName;

  factory _$SettingState([void Function(SettingStateBuilder)? updates]) =>
      (new SettingStateBuilder()..update(updates)).build();

  _$SettingState._({this.locale, this.themeName}) : super._();

  @override
  SettingState rebuild(void Function(SettingStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingStateBuilder toBuilder() => new SettingStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingState &&
        locale == other.locale &&
        themeName == other.themeName;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, locale.hashCode), themeName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SettingState')
          ..add('locale', locale)
          ..add('themeName', themeName))
        .toString();
  }
}

class SettingStateBuilder
    implements Builder<SettingState, SettingStateBuilder> {
  _$SettingState? _$v;

  Locale? _locale;
  Locale? get locale => _$this._locale;
  set locale(Locale? locale) => _$this._locale = locale;

  String? _themeName;
  String? get themeName => _$this._themeName;
  set themeName(String? themeName) => _$this._themeName = themeName;

  SettingStateBuilder();

  SettingStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _locale = $v.locale;
      _themeName = $v.themeName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SettingState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SettingState;
  }

  @override
  void update(void Function(SettingStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SettingState build() {
    final _$result =
        _$v ?? new _$SettingState._(locale: locale, themeName: themeName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
