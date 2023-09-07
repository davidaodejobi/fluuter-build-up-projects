import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isLightMode = true;

  bool get themeMode {
    return _isLightMode;
  }

  bool get checkLightMode {
    return _isLightMode;
  }

  bool get checkDarkMode {
    return !_isLightMode;
  }

  toggleThemeMode() {
    _isLightMode = !_isLightMode;
    notifyListeners();
    saveThemeMode();
  }

  setThemeMode(bool isLightMode) {
    _isLightMode = isLightMode;
    notifyListeners();
    saveThemeMode();
  }

  dontToggleThemeMode() {
    _isLightMode = _isLightMode;
    notifyListeners();
  }

  Future<void> saveThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('_isLightMode', _isLightMode);
  }
}
