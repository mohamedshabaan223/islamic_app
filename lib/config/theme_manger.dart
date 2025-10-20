import 'package:flutter/material.dart';
import 'package:islamiii_app/core/colors_manger.dart';

class ThemeManger {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: ColorsManger.black),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        color: ColorsManger.black,
      ),
    ),
    canvasColor: ColorsManger.primarylight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      backgroundColor: ColorsManger.primarylight,
      selectedItemColor: ColorsManger.black,
      unselectedItemColor: ColorsManger.white,
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: ColorsManger.black,
      ),
    ),
    dividerTheme: DividerThemeData(
      color: ColorsManger.primarylight,
      thickness: 1.5,
      space: 10,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: ColorsManger.primarylight,
      onPrimary:  ColorsManger.white,
      secondary:  ColorsManger.primarylight,
      onSecondary: ColorsManger.black,
      error: ColorsManger.white,
      onError: ColorsManger.white,
      surface: ColorsManger.white,
      onSurface: ColorsManger.primarylight,
    ),
  );
  static ThemeData darkTheme = ThemeData(
     colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: ColorsManger.primaryDark,
      onPrimary:  ColorsManger.primaryDark,
      secondary:  ColorsManger.gold,
      onSecondary: ColorsManger.gold,
      error: ColorsManger.white,
      onError: ColorsManger.white,
      surface: ColorsManger.black,
      onSurface: ColorsManger.white,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: ColorsManger.white),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        color: ColorsManger.white,
      ),
    ),

    canvasColor: ColorsManger.primaryDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      backgroundColor: ColorsManger.primaryDark,
      selectedItemColor: ColorsManger.gold,
      unselectedItemColor: ColorsManger.white,
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: ColorsManger.white,
      ),
    ),
    dividerTheme: DividerThemeData(
      color: ColorsManger.gold,
      thickness: 1.5,
      space: 10,
    ),
  );
}
