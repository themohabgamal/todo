import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class settingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.dark;
  String currentLang = 'en';
  void setTheme(ThemeMode theme) {
    currentTheme = theme;
    notifyListeners();
  }

  void changeLange(String lang) {
    currentLang = lang;
    notifyListeners();
  }
}
