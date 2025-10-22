import 'package:flutter/material.dart';

class SettingProvider  with ChangeNotifier{
  ThemeMode appThemeMode = ThemeMode.dark;
  bool get isDark => appThemeMode == ThemeMode.dark;
  void themeAppMode(ThemeMode themeMode){
    appThemeMode = themeMode;
    notifyListeners();
  }
}