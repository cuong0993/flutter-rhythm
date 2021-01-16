import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Preferences _instance;
  static SharedPreferences _instance1;

  Preferences._internal();

  static const PREFERENCE_LOCALE_NAME = 'LocaleName';
  static const PREFERENCE_THEME_NAME = 'ThemeName';

  static Future<Preferences> getInstance() async {
    _instance ??= Preferences._internal();
    _instance1 ??= await SharedPreferences.getInstance();
    return _instance;
  }

  String get localeName => _instance1.getString(PREFERENCE_LOCALE_NAME);

  set localeName(String localeName) {
    _instance1.setString(PREFERENCE_LOCALE_NAME, localeName);
  }

  String get themeName => _instance1.getString(PREFERENCE_THEME_NAME);

  set themeName(String themeName) {
    _instance1.setString(PREFERENCE_THEME_NAME, themeName);
  }
}
