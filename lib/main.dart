import 'package:flutter/material.dart';
import 'package:islamiii_app/my_app/my_app.dart';
import 'package:islamiii_app/providers/setting_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_)=> SettingProvider(),
    child: const MyApp()));
}

