import 'package:flutter/material.dart';
import 'package:islamiii_app/core/route_manger.dart';
import 'package:islamiii_app/presentation/screens/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        RouteManger.homeScreen:(_)=>HomeScreen(),
      },
      initialRoute: RouteManger.homeScreen,
    );}
      
}