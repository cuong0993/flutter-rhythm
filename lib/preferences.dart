import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtilityProvider = Provider<Preferences>((ref) {
  final _sharedPrefs = ref.watch(sharedPreferencesProvider);

  return Preferences(pref: _sharedPrefs);
});

class Preferences {
  Preferences({
    required this.pref,
  });

  final SharedPreferences pref;

  static const preferenceLocaleName = 'LocaleName';
  static const preferenceThemeName = 'ThemeName';

  String? getLocaleName() => pref.getString(preferenceLocaleName);

  Future<void> setLocaleName(String localeName) async {
    await pref.setString(preferenceLocaleName, localeName);
  }

  String? getThemeName() => pref.getString(preferenceThemeName);

  Future<void> setThemeName(String themeName) async {
    await pref.setString(preferenceThemeName, themeName);
  }
}
