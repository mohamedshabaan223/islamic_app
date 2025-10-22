import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier{
  String localapp = 'en';
  void changeLangApp(String lang){
    localapp = lang;
    notifyListeners();
  }
}