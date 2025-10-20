import 'package:flutter/material.dart';
import 'package:islamiii_app/config/theme_manger.dart';
import 'package:islamiii_app/core/route_manger.dart';
import 'package:islamiii_app/presentation/screens/hadith_details/hadith_details_screen.dart';
import 'package:islamiii_app/presentation/screens/home/home_screen.dart';
import 'package:islamiii_app/presentation/screens/quran_details/quran_details.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        RouteManger.homeScreen:(_)=>HomeScreen(),
        RouteManger.quranDetailsScreen:(_)=> QuranDetails(),
        RouteManger.hadithDetailsScreen:(_)=> HadithDetailsScreen(),
      },
      initialRoute: RouteManger.homeScreen,
      theme: ThemeManger.lightTheme,
      darkTheme: ThemeManger.darkTheme,
      themeMode: ThemeMode.dark,
    );}
      
}