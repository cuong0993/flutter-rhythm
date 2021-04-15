import 'dart:ui';

import 'package:built_value/built_value.dart';

part 'setting_state.g.dart';

abstract class SettingState
    implements Built<SettingState, SettingStateBuilder> {
  factory SettingState([Function(SettingStateBuilder) updates]) =
      _$SettingState;

  SettingState._();

  Locale? get locale;

  String? get themeName;
}
