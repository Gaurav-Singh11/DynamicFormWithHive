import 'package:flutter/material.dart';

class BaseProvider extends ChangeNotifier {
  void refreshState() {
    notifyListeners();
  }
}
