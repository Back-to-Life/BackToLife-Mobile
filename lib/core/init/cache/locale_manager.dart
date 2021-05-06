import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/enum/locale_keys_enum.dart';

class LocaleManager {
  static final LocaleManager _instance = LocaleManager._init();

  SharedPreferences? _preferences;
  static LocaleManager get instance => _instance;

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }
  static Future<Null> preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
    return null;
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }

  Future<void> setString(PreferencesKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  Future<void> setBooleanValue(PreferencesKeys key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

  String getStringValue(PreferencesKeys key) =>
      _preferences!.getString(key.toString()) ?? '';

  bool getBoolValue(PreferencesKeys key) =>
      _preferences!.getBool(key.toString()) ?? false;

  //Saved Locale English-Turkish Language Manager
  Future<void> setLanguageManager(PreferencesKeys key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

  //Get locale english-turkish language Manager
  bool getLnaguageManager(PreferencesKeys key) =>
      _preferences!.getBool(key.toString()) ?? false;

  //sharedManager theme mode
  Future<void> setThemeManager(PreferencesKeys key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

  //Get locale theme  Manager
  bool getThemeManager(PreferencesKeys key) =>
      _preferences!.getBool(key.toString()) ?? true;
}
