import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_usage/components/enum/shared_preferences_keys.dart';

class PreferenceUtils {
  static Future<SharedPreferences> get _instance async => _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences _prefsInstance;

  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String getString(SharedPrefKeys key) {
    return _prefsInstance.getString(key.toString());
  }

  static void setString(SharedPrefKeys key, String value) {
    _prefsInstance.setString(key.toString(), value);
  }
  static void remove(SharedPrefKeys key){
    _prefsInstance.remove(key.toString());
  }
}