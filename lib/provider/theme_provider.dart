import 'package:flutter/material.dart';
/// Provider for multi theme support
class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  void updateTheme(bool isDarkMode) {
    this.isDarkMode = isDarkMode;
    notifyListeners();
  }
}