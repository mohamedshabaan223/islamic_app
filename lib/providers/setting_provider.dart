import 'package:flutter/material.dart';

class SettingProvider  with ChangeNotifier{
  ThemeMode appThemeMode = ThemeMode.dark;
  String appLang = 'en';
  bool get isDark => appThemeMode == ThemeMode.dark;
  void themeAppMode(ThemeMode themeMode){
    appThemeMode = themeMode;
    notifyListeners();
  }
 void languageApp(String currentLang){
  appLang = currentLang;
  notifyListeners();
 }
}