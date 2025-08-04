import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesHelper {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> _checkPref() async {
    if (_prefs == null) {
      await init();
    }
  }

  // Int methods
  static void setInt(String key, int value) {
    try {
      _prefs?.setInt(key, value);
    } catch (e) {}
  }

  static Future<void> setIntAsync(String key, int value) async {
    try {
      await _checkPref();
      _prefs?.setInt(key, value);
    } catch (e) {}
  }

  static int getInt(String key, int defaultValue) {
    try {
      return _prefs?.getInt(key) ?? defaultValue;
    } catch (e) {}
    return defaultValue;
  }

  static Future<int> getIntAsync(String key, int defaultValue) async {
    try {
      await _checkPref();
      return _prefs?.getInt(key) ?? defaultValue;
    } catch (e) {}
    return defaultValue;
  }

  // Double methods
  static void setDouble(String key, double value) {
    try {
      _prefs?.setDouble(key, value);
    } catch (e) {}
  }

  static Future<void> setDoubleAsync(String key, double value) async {
    try {
      await _checkPref();
      _prefs?.setDouble(key, value);
    } catch (e) {}
  }

  static double getDouble(String key, double defaultValue) {
    try {
      return _prefs?.getDouble(key) ?? defaultValue;
    } catch (e) {}
    return defaultValue;
  }

  static Future<double> getDoubleAsync(String key, double defaultValue) async {
    try {
      await _checkPref();
      return _prefs?.getDouble(key) ?? defaultValue;
    } catch (e) {}
    return defaultValue;
  }

  // String methods
  static void setString(String key, String value) {
    try {
      _prefs?.setString(key, value);
    } catch (e) {}
  }

  static Future<void> setStringAsync(String key, String value) async {
    try {
      await _checkPref();
      _prefs?.setString(key, value);
    } catch (e) {}
  }

  static Future<void> setStringListAsync(String key, List<String> defaultValue) async {
    try {
      await _checkPref();
      _prefs?.setStringList(key, defaultValue);
    } catch (e) {}
  }

  static String getString(String key, String defaultValue) {
    try {
      return _prefs?.getString(key) ?? defaultValue;
    } catch (e) {}
    return defaultValue;
  }

  static Future<String> getStringAsync(String key, String defaultValue) async {
    try {
      await _checkPref();
      return _prefs?.getString(key) ?? defaultValue;
    } catch(e) {}
    return defaultValue;
  }

  static List<String> getStringList(String key, List<String> defaultValue) {
    try {
      return _prefs?.getStringList(key) ?? defaultValue;
    } catch (e) {}
    return defaultValue;
  }

  static Future<List<String>> getStringListAsync(String key, List<String> defaultValue) async {
    try {
      await _checkPref();
      return _prefs?.getStringList(key) ?? defaultValue;
    } catch(e){}
    return defaultValue;
  }

  // Bool methods
  static void setBool(String key, bool value) {
    try {
      _prefs?.setBool(key, value);
    } catch (e) {}
  }

  static Future<void> setBoolAsync(String key, bool value) async {
    try {
      await _checkPref();
      _prefs?.setBool(key, value);
    } catch (e) {}
  }

  static bool getBool(String key, bool defaultValue) {
    try {
      return _prefs?.getBool(key) ?? defaultValue;
    } catch (e) {}
    return defaultValue;
  }

  static Future<bool> getBoolAsync(String key, bool defaultValue) async {
    try {
      await _checkPref();
      return _prefs?.getBool(key) ?? defaultValue;
    } catch (e) {}
    return defaultValue;
  }

}
