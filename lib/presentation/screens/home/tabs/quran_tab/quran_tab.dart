import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiii_app/core/image_manger.dart';
import 'package:islamiii_app/core/route_manger.dart';
class QuranTab extends StatefulWidget {
 const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس",
  ];
  List<int> virsesnum =[];
  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    if (virsesnum.isEmpty) loadVirsesCount();
    return 
       Stack(
         children: [
           Column(
            children: [
              Image.asset(ImageManger.quranHeader, height: hight * 0.29),
              Divider(height: 4,),
              Row(children: [
                Expanded(child: Text('Suran Name' , textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),)),
                Expanded(child: Text('Virses Count' , textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)
                )),
              ],),
              Divider(height: 5,),
              virsesnum.isEmpty ? Expanded(child: Center(child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ),)):
              Expanded(
                child: ListView.separated(
                  itemBuilder:
                      (context, index) => Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              RouteManger.quranDetailsScreen,
                              arguments: QuranModel(
                                name: suraNames[index],
                                index: index,
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  suraNames[index],
                                  style: Theme.of(context).textTheme.titleMedium,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                                Expanded(
                                child: Text(
                                  virsesnum[index].toString(),
                                  style: Theme.of(context).textTheme.titleMedium,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => Divider(height: 1,),
                  itemCount: suraNames.length,
                ),
              ),
            ],
                 ),
           Align(
            alignment: Alignment.center,
            child: VerticalDivider(
              indent:hight * 0.29 ,
            ),)
         ],
       );
    
  }

  Future<void> loadVirsesCount()async{ 
    List<int> _virsesCount =[];
    for (var i = 0; i < suraNames.length; i++) {
      String data = await rootBundle.loadString('assets/quran/${i+1}.txt');
      List<String> content = data.trim().split('\n');
      content.removeWhere(
        (element) => element.trim().isEmpty
      );
      _virsesCount.add(content.length);
    }
    virsesnum = _virsesCount;
    setState(() {
      
    });
  }
}


class QuranModel {
  String name;
  int index;
  QuranModel({required this.name, required this.index});
}
