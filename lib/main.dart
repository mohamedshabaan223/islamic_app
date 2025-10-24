import 'package:flutter/material.dart';
import 'package:islamiii_app/my_app/my_app.dart';
import 'package:islamiii_app/providers/language_provider.dart';
import 'package:islamiii_app/providers/setting_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
   
   providers: [
    ChangeNotifierProvider(create: (context) => SettingProvider()..getThemeData()),
    ChangeNotifierProvider(create: (context)=> LanguageProvider()..getLangData()),
   ],
    child: const MyApp()));
}

