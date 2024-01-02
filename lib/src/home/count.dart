import 'package:flutter/material.dart';

class Count extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  void increment() {
    _value++;
    notifyListeners();
  }

  void reset() {
    _value = 0;
    notifyListeners();
  }

  void decrement() {
    if (_value == 0) {
      return;
    }
    _value--;
    notifyListeners();
  }
}
