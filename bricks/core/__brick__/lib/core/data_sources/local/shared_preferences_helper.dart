import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../di/dependency_injection.dart';

class SharedPreferencesHelper {
  // private constructor as I don't want to allow creating an instance of this class itself.
  SharedPreferencesHelper._();

  static final SharedPreferences _sharedPreferences =
      getIt<SharedPreferences>();
  static const FlutterSecureStorage _flutterSecureStorage =
      FlutterSecureStorage();

  /// Removes a value from SharedPreferences with given [key].
  static Future<void> removeData(String key) async {
    await _sharedPreferences.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static Future<void> clearAllData() async {
    await _sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static Future<void> setData(String key, value) async {
    switch (value.runtimeType) {
      case const (String):
        await _sharedPreferences.setString(key, value);
        break;
      case const (int):
        await _sharedPreferences.setInt(key, value);
        break;
      case const (bool):
        await _sharedPreferences.setBool(key, value);
        break;
      case const (double):
        await _sharedPreferences.setDouble(key, value);
        break;
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static bool getBool(String key) {
    return _sharedPreferences.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static double getDouble(String key) {
    return _sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static int getInt(String key) {
    return _sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets an String value from SharedPreferences with given [key].
  static String getString(String key) {
    return _sharedPreferences.getString(key) ?? '';
  }

  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  static Future<void> setSecuredString(String key, String value) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  static Future<String> getSecuredString(String key) async {
    final String value = await _flutterSecureStorage.read(key: key) ?? '';
    return value;
  }

  /// Removes all keys and values in the FlutterSecureStorage
  static Future<void> clearAllSecuredData() async {
    await _flutterSecureStorage.deleteAll();
  }
}
