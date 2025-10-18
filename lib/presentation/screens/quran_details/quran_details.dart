import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiii_app/core/image_manger.dart';
import 'package:islamiii_app/core/text_manger.dart';
import 'package:islamiii_app/presentation/screens/home/tabs/quran_tab/quran_tab.dart';

class QuranDetails extends StatefulWidget {
 const  QuranDetails({super.key});


  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
   List<String> suranContent =[];
  @override
  Widget build(BuildContext context) {
    QuranModel quranModel =ModalRoute.of(context)!.settings.arguments as QuranModel;
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if(suranContent.isEmpty) loadSuraContent(quranModel.index);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(
          Theme.of(context).colorScheme.brightness == Brightness.light ? ImageManger.bgLight : ImageManger.bgDark),
        fit:BoxFit.cover)
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(TextManger.appLabel),),
        body: Container(
          padding: EdgeInsets.symmetric(
            vertical: hight *0.02,
            horizontal: width * 0.02
          ),
          margin: EdgeInsets.symmetric(
            vertical: hight * 0.04,
            horizontal: width * 0.09
          ),
          height: hight * 0.9,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [Text(quranModel.name , style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),),
            Divider(
              indent: width * 0.1
              ,
              endIndent: width * 0.1,
            ),
            const SizedBox(height: 5,),
            suranContent.isEmpty ? Expanded(child: Center(child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.secondary,
            ))):
            Expanded(child: ListView.builder(itemBuilder: (context , index) => Text(suranContent[index] , 
            style:Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20 ,
             color: Theme.of(context).colorScheme.onSecondary,) ,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,),
            itemCount: suranContent.length,)),
            ],
          
          ),
        ),
      
      ),
    );
  }

  Future<void> loadSuraContent( int index ) async{
    String data = await rootBundle.loadString('assets/quran/${index+1}.txt');
    suranContent = data.trim().split('\n');
    setState(() {
      
    });
    
  }
}