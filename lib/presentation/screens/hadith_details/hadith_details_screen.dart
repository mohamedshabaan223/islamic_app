import 'package:flutter/material.dart';
import 'package:islamiii_app/core/image_manger.dart';
import 'package:islamiii_app/core/text_manger.dart';
import 'package:islamiii_app/presentation/screens/home/tabs/hadith_tab/hadith_tab.dart';

class HadithDetailsScreen extends StatelessWidget {
  const HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HadithModel hadithModel = ModalRoute.of(context)!.settings.arguments as HadithModel;
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
       decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(
          Theme.of(context).colorScheme.brightness == Brightness.light ? ImageManger.bgLight : ImageManger.bgDark),
        fit:BoxFit.cover)
      ),
      child: Scaffold(
         appBar: AppBar(title: Text(TextManger.appLabel),
         ),
          body: Container(
          padding: EdgeInsets.symmetric(
            vertical: hight *0.02,
            horizontal: width * 0.04
          ),
          margin: EdgeInsets.symmetric(
            vertical: hight * 0.04,
            horizontal: width * 0.08
          ),
          height: hight * 0.9,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [Text(hadithModel.name , style: Theme.of(context).textTheme.titleMedium?.copyWith(
               color: Theme.of(context).colorScheme.onSecondary,
            ),),
            Divider(
              indent: width * 0.05
              ,
              endIndent: width * 0.05,
            ),
            const SizedBox(height: 5,),
            Expanded(child: SingleChildScrollView(
              child: Text(hadithModel.content ,
              style:Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20 ,
               color: Theme.of(context).colorScheme.onSecondary,) ,
               textDirection: TextDirection.rtl,
            
              ),
            ))
           
            ]
          ),
        ),
      ));
  }
}