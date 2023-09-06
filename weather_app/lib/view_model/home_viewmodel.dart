import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int counter = 20;

  void increase() {
    counter++;
    notifyListeners();
  }

  void decrease() {
    counter--;
    notifyListeners();
  }
}
