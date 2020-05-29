import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static Future<SharedPreferences> get _instance async => _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences _prefsInstance;

  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String getString(String key) {
    return _prefsInstance.getString(key);
  }

  static void setString(String key, String value) {
    _prefsInstance.setString(key, value);
  }
  static void remove(String key){
    _prefsInstance.remove(key);
  }
}