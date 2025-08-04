import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';


class DataStoreHelper {
  static late SharedPreferences _sharedPref;
  static bool _isInitialized = false;
  static Map<String, dynamic> _fallbackStorage = {};

  static bool get isInitialized => _isInitialized;

  static Future<void> ensureDataStoreDirectory() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final dataStoreDir = Directory('${directory.path}/datastore');
      
      if (!await dataStoreDir.exists()) {
        await dataStoreDir.create(recursive: true);
      }
    } catch (e) {
    }
  }

  static Future<void> initDataStore() async {
    try {
      await ensureDataStoreDirectory();
      _sharedPref = await SharedPreferences.getInstance();
      _isInitialized = true;
    } catch (e) {
      try {
        await clearDataStore();
        _sharedPref = await SharedPreferences.getInstance();
        _isInitialized = true;
      } catch (innerError) {
        try {
          final directory = await getApplicationDocumentsDirectory();
          final dataStoreDir = Directory('${directory.path}/datastore');
          if (await dataStoreDir.exists()) {
            await dataStoreDir.delete(recursive: true);
          }
          await dataStoreDir.create(recursive: true);
          _sharedPref = await SharedPreferences.getInstance();
          _isInitialized = true;
        } catch (finalError) {
          _isInitialized = false;
        }
      }
    }
  }

  static void setString(String key, String value) {
    try {
      if (_isInitialized) {
        _sharedPref.setString(key, value);
      }
      _fallbackStorage[key] = value;
    } catch (e) {
      _fallbackStorage[key] = value;
    }
  }

  static String getString(String key, String defaultValue) {
    try {
      if (_isInitialized) {
        final value = _sharedPref.getString(key);
        if (value != null) {
          _fallbackStorage[key] = value;
          return value;
        }
      }
    } catch (e) {
    }
    return _fallbackStorage[key] as String? ?? defaultValue;
  }

  static void setInt(String key, int value) {
    try {
      if (_isInitialized) {
        _sharedPref.setInt(key, value);
      }
      _fallbackStorage[key] = value;
    } catch (e) {
      _fallbackStorage[key] = value;
    }
  }

  static int getInt(String key, int defaultValue) {
    try {
      if (_isInitialized) {
        final value = _sharedPref.getInt(key);
        if (value != null) {
          _fallbackStorage[key] = value;
          return value;
        }
      }
    } catch (e) {
    }
    return _fallbackStorage[key] as int? ?? defaultValue;
  }

  static void setBool(String key, bool value) {
    try {
      if (_isInitialized) {
        _sharedPref.setBool(key, value);
      }
      _fallbackStorage[key] = value;
    } catch (e) {
      _fallbackStorage[key] = value;
    }
  }

  static bool getBool(String key, bool defaultValue) {
    try {
      if (_isInitialized) {
        final value = _sharedPref.getBool(key);
        if (value != null) {
          _fallbackStorage[key] = value;
          return value;
        }
      }
    } catch (e) {
    }

    return _fallbackStorage[key] as bool? ?? defaultValue;
  }

  static void setDouble(String key, double value) {
    try {
      if (_isInitialized) {
        _sharedPref.setDouble(key, value);
      }
      _fallbackStorage[key] = value;
    } catch (e) {
      _fallbackStorage[key] = value;
    }
  }

  static double getDouble(String key, double defaultValue) {
    try {
      if (_isInitialized) {
        final value = _sharedPref.getDouble(key);
        if (value != null) {
          _fallbackStorage[key] = value;
          return value;
        }
      }
    } catch (e) {

    }

    return _fallbackStorage[key] as double? ?? defaultValue;
  }

  static Future<void> setJsonList(String key, List<dynamic> value) async {
    final jsonString = json.encode(value);
    setString(key, jsonString);
  }

  static Future<List<dynamic>?> getJsonList(String key) async {
    final jsonString = getString(key, "");
    if (jsonString.isEmpty) return null;
    return json.decode(jsonString) as List<dynamic>;
  }

  static Future<bool> clearDataStore() async {
    try {
      _fallbackStorage.clear();
      if (_isInitialized) {
        return await _sharedPref.clear();
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
