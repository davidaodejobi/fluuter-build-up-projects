import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isLightMode = true;

  bool get isLightMode {
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
  }

  dontToggleThemeMode() {
    _isLightMode = _isLightMode;
    notifyListeners();
  }
}
