import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  bool get onboardingViewed {
    return _prefs.getBool('onboardingViewed');
  }

  set onboardingViewed(bool value) {
    _prefs.setBool('onboardingViewed', value);
  }
}
