import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isLightMode = true;
  bool isCheckedLightText = false;
  bool isCheckedLightSubText = true;

  bool get isLightMode {
    return _isLightMode;
  }

  toggleThemeMode() {
    _isLightMode = !_isLightMode;
    isCheckedLightText = !isCheckedLightText;
    isCheckedLightSubText = !isCheckedLightSubText;
    notifyListeners();
  }
}
