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

  set token(String token) => _prefs.setString('token', token);

  String get token => _prefs.getString('token');

  set posterVoted(bool voted) => _prefs.setBool('posterVoted', voted);

  bool get posterVoted => false;

  set selectedPoster(int selectedPoster) =>
      _prefs.setInt('selectedPoster', selectedPoster);

  int get selectedPoster => _prefs.getInt('selectedPoster');

  set isPremium(bool isPremium) => _prefs.setBool('isPremium', isPremium);

  bool get isPremium => _prefs.getBool('isPremium') ?? false;
}
