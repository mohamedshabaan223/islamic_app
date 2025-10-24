import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier{
  String localapp = 'en';
  void changeLangApp(String lang){
    localapp = lang;
    saveLang(lang);
    notifyListeners();
  }
  void saveLang(String lang) async{
    SharedPreferences sharedPreferences =await  SharedPreferences.getInstance();
    if(lang =='en'){
      sharedPreferences.setString('lang', 'en');
    }else{
      sharedPreferences.setString('lang', 'ar');
    }
  }
  void getLangData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   String lang = sharedPreferences.getString('lang') ?? 'en';
    if(lang == 'en'){
      localapp = 'en';
    }else{
      localapp ='ar';
    }
    notifyListeners();
  }
}