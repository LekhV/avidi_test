import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesWrapper {
  static late SharedPreferences _sharedPref;

  static processInitialize() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  static Future<bool> setToken(String token) {
    return _sharedPref.setString('TestAppToken', token);
  }

  static String getToken() {
    return _sharedPref.getString('TestAppToken') ?? '';
  }

  static Future<bool> setRefreshToken(String token) {
    return _sharedPref.setString('TestAppRefreshToken', token);
  }

  static String getRefreshToken() {
    return _sharedPref.getString('TestAppRefreshToken') ?? '';
  }
}
