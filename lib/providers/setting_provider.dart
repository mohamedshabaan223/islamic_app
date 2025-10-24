import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider  with ChangeNotifier{
  ThemeMode appThemeMode = ThemeMode.dark;
  bool get isDark => appThemeMode == ThemeMode.dark;
  void themeAppMode(ThemeMode themeMode){
    if(appThemeMode == themeMode) return;
    appThemeMode = themeMode;
    saveThemeData(themeMode);
    notifyListeners();
  }
   void saveThemeData(ThemeMode themeMode)async{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      if(themeMode == ThemeMode.light){
        sharedPreferences.setString('theme', 'light');
      }else{
        sharedPreferences.setString('theme', 'dark');
      }
    }
    void getThemeData()async{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String theme = sharedPreferences.getString('theme')?? 'dark';
      if(theme == 'light'){
        appThemeMode = ThemeMode.light;
      }else{
        appThemeMode = ThemeMode.dark;
      }
      notifyListeners();
    }
}