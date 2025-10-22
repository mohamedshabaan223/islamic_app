import 'package:flutter/material.dart';
import 'package:islamiii_app/core/image_manger.dart';
import 'package:islamiii_app/core/text_manger.dart';
import 'package:islamiii_app/presentation/screens/home/tabs/hadith_tab/hadith_tab.dart';
import 'package:islamiii_app/presentation/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islamiii_app/presentation/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:islamiii_app/presentation/screens/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islamiii_app/presentation/screens/home/tabs/setting_tab/setting_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          title: Text(AppLocalizations.of(context)!.islami,
        ),),
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
          label: AppLocalizations.of(context)!.quran),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(ImageManger.hadihTab)),
          label: AppLocalizations.of(context)!.hadith),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(ImageManger.radioTab)),
          label: AppLocalizations.of(context)!.radio),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(ImageManger.sebhaTab)),
          label: AppLocalizations.of(context)!.sebha),
          BottomNavigationBarItem(icon: Icon(Icons.settings),
          label: AppLocalizations.of(context)!.setting),
        ]),
      ));
  }
}