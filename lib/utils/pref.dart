import 'package:shared_preferences/shared_preferences.dart';

class LocalPref extends Pref {
  @override
  Future<bool> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  @override
  Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<bool> saveInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setInt(key, value);
  }

  Future<int> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  Future<bool> saveBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }
}

abstract class Pref {
  Future<bool> saveString(String key, String value);

  Future<String> getString(String key);
}

class PrefKey {
  static const String isLogged = 'isLogged';
  static const String token_key = 'token_key';
  static const String push_key = 'push_key';
  static const String expired_time = 'expired_time';
}
