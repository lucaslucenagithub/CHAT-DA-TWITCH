import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService with ChangeNotifier {
  Future<String> readSecureData(String key) async {
    final _storage = await SharedPreferences.getInstance();
    String result = _storage.getString(key);
    return result;
  }

  Future<void> writeSecureData(String key, String value) async {
    final _storage = await SharedPreferences.getInstance();
    await _storage.setString(key, value);
    notifyListeners();
  }

  Future<void> deleteSecureData(String key) async {
    final _storage = await SharedPreferences.getInstance();
    await _storage.clear();
    notifyListeners();
  }
}
