import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Preferences _instance;
  static SharedPreferences _instance1;
  Preferences._internal();
  static const KEY_PREFERENCES = 'Preferences';
  static const PREFERENCE_IS_SHOW_RATE_DIALOG_AGAIN = 'IsShowRateDialogAgain';
  static const PREFERENCE_LAUNCH_COUNT = 'LaunchCount';
  static const PREFERENCE_MILLISECONDS_FIRST_LAUNCH = 'MillisecondsFirstLaunch';
  static const PREFERENCE_LOCALE_NAME = 'LocaleName';

  static Future<Preferences> getInstance() async {
    _instance ??= Preferences._internal();
    _instance1 ??= await SharedPreferences.getInstance();
    return _instance;
  }

  bool get isShowRateDialogAgain => _instance1.getBool(PREFERENCE_IS_SHOW_RATE_DIALOG_AGAIN) ?? true;
  set isShowRateDialogAgain(bool isShowRateDialogAgain) {
    _instance1.setBool(PREFERENCE_IS_SHOW_RATE_DIALOG_AGAIN, isShowRateDialogAgain);
  }

  int get launchCount => _instance1.getInt(PREFERENCE_LAUNCH_COUNT) ?? 0;
  set launchCount(int launchCount) {
    _instance1.setInt(PREFERENCE_LAUNCH_COUNT, launchCount);
  }

  int get millisecondsFirstLaunch => _instance1.getInt(PREFERENCE_MILLISECONDS_FIRST_LAUNCH) ?? DateTime.now().millisecondsSinceEpoch;
  set millisecondsFirstLaunch(int millisecondsFirstLaunch) {
    _instance1.setInt(PREFERENCE_MILLISECONDS_FIRST_LAUNCH, millisecondsFirstLaunch);
  }

  String get localeName => _instance1.getString(PREFERENCE_LOCALE_NAME) ?? 'en';
  set localeName(String localeName) {
    _instance1.setString(PREFERENCE_LOCALE_NAME, localeName);
  }
}