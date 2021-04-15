import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const preferenceLocaleName = 'LocaleName';
  static const preferenceThemeName = 'ThemeName';

  static Future<String?> getLocaleName() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(preferenceLocaleName);
  }

  static Future<void> setLocaleName(String localeName) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(preferenceLocaleName, localeName);
  }

  static Future<String?> getThemeName() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(preferenceThemeName);
  }

  static Future<void> setThemeName(String themeName) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(preferenceThemeName, themeName);
  }
}
