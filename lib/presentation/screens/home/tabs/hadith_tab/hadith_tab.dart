import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiii_app/core/image_manger.dart';
import 'package:islamiii_app/core/route_manger.dart';
import 'package:islamiii_app/core/text_manger.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadithModel> hadethModelList =[];
  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    if (hadethModelList.isEmpty) {
      loadhadith();
    }
    return Column(children: [
      Image.asset(ImageManger.hadithHeader , height: hight* 0.29,),
     Divider(height: 2,),
     Center(child: Text(TextManger.hadithLabel ,
     style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),)),
     Divider(height: 2,),
     hadethModelList.isEmpty ? Expanded(child: Center(child: CircularProgressIndicator(
      color: Theme.of(context).colorScheme.secondary,
     ),)):
     Expanded(child:ListView.separated(itemBuilder: (context , index) => 
     InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(RouteManger.hadithDetailsScreen,
        arguments: hadethModelList[index]);
      },
       child: Text(hadethModelList[index].name ,
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center,),
     ),
     itemCount: hadethModelList.length,
     separatorBuilder: (context , index) => Divider(height: 1,),)
     ),
    ],);

  }

 Future<void> loadhadith() async{
  List<HadithModel> _hadethModelList =[];
  String data = await rootBundle.loadString('assets/hadith/ahadeth.txt');
  List<String> hadithList = data.trim().split('#');
  hadithList.removeWhere((element) => element.trim().isEmpty);
  for (var i = 0; i < hadithList.length; i++) {
    int index = hadithList[i].trim().indexOf('\n');
    String name = hadithList[i].trim().substring(0,index);
    String content = hadithList[i].trim().substring(index+1);
    _hadethModelList.add(HadithModel(name: name, content: content , 
    ));
  }
  hadethModelList =_hadethModelList;
  setState(() {
    
  });
 }
}
class HadithModel{
  String name ;
  String content;
  HadithModel({required this.name , required this.content});

}