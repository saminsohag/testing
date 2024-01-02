import 'package:flutter/material.dart';

class CounterController extends ChangeNotifier {
  int value = 0;
  increment() {
    value++;
    notifyListeners();
  }
}
