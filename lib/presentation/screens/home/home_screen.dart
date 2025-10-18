import 'package:flutter/material.dart';
import 'package:islamiii_app/core/image_manger.dart';
import 'package:islamiii_app/core/text_manger.dart';
import 'package:islamiii_app/presentation/screens/home/tabs/hadith_tab/hadith_tab.dart';
import 'package:islamiii_app/presentation/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islamiii_app/presentation/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:islamiii_app/presentation/screens/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islamiii_app/presentation/screens/home/tabs/setting_tab/setting_tab.dart';

class HomeScreen extends StatefulWidget {
 HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 List<Widget> tabs =[
  QuranTab(),
  HadithTab(),
  RadioTab(),
  SebhaTab(),
  SettingTab(), 
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(
         Theme.of(context).colorScheme.brightness == Brightness.light ? ImageManger.bgLight : ImageManger.bgDark),
        fit: BoxFit.cover)
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(TextManger.appLabel),
        ),
        body: tabs[index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap:(value) {
            index = value;
            setState(() {
              
            });
          },
          items: [
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(ImageManger.quranTab)),
          label: TextManger.quranTab),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(ImageManger.hadihTab)),
          label: TextManger.hadithTab),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(ImageManger.radioTab)),
          label: TextManger.radioTab),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(ImageManger.sebhaTab)),
          label: TextManger.sebhaTab),
          BottomNavigationBarItem(icon: Icon(Icons.settings),
          label: TextManger.settingTab),
        ]),
      ));
  }
}