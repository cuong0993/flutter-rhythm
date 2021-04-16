import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtilityProvider = Provider<SharedUtility>((ref) {
  final _sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SharedUtility(pref: _sharedPrefs);
});

class SharedUtility {
  SharedUtility({
    required this.pref,
  });

  final SharedPreferences pref;

  static const preferenceLocaleName = 'LocaleName';
  static const preferenceThemeName = 'ThemeName';

  String? getLocaleName() {
    return pref.getString(preferenceLocaleName);
  }

  Future<void> setLocaleName(String localeName) async {
    await pref.setString(preferenceLocaleName, localeName);
  }

  String? getThemeName() {
    return pref.getString(preferenceThemeName);
  }

  Future<void> setThemeName(String themeName) async {
    await pref.setString(preferenceThemeName, themeName);
  }
}
