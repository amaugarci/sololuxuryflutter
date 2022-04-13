// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

const String key_local_store_model = "local_store_model";

getPrefIntValue(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt(key);
}

getPrefStringValue(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key) ?? "";
}
// getPrefRecentlyValue(String key) async {
//   final prefs = await SharedPreferences.getInstance();
//   return prefs.getString(key) ?? "";
// }
setPrefIntValue(String key, value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

setPrefStringValue(String key, value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

// setPrefRecentlyValue(String key, value) async {
//   final prefs = await SharedPreferences.getInstance();
//   prefs.setString(key, value);
// }

removePrefValue(String key) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}

