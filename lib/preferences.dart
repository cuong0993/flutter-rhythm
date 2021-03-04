import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const PREFERENCE_LOCALE_NAME = 'LocaleName';
  static const PREFERENCE_THEME_NAME = 'ThemeName';

  static Future<String?> getLocaleName() async {
    final pref = await SharedPreferences.getInstance();
    pref.getString(PREFERENCE_LOCALE_NAME);
  }

  static Future<void> setLocaleName(String localeName) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(PREFERENCE_LOCALE_NAME, localeName);
  }

  static Future<String?> getThemeName() async {
    final pref = await SharedPreferences.getInstance();
    pref.getString(PREFERENCE_THEME_NAME);
  }

  static Future<void> setThemeName(String themeName) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(PREFERENCE_THEME_NAME, themeName);
  }
}
