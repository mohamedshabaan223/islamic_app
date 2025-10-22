import 'package:flutter/material.dart';
import 'package:islamiii_app/core/image_manger.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> azkar =[
    'سبحان الله',
    'الحمد لله',
    'الله اكبر '];
  int counter =0;
  int index =0;
  double angle =0;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Padding(
        padding:  EdgeInsets.only(top: size.height* 0.02),
        child: Column(
          
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(theme.colorScheme.brightness == Brightness.light ? ImageManger.headSebhaLight : ImageManger.headSebhaDark),
                Padding(
                  padding:  EdgeInsets.only(top: size.height * 0.081 ),
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset(
                      height: size.height * 0.25,
                      theme.colorScheme.brightness == Brightness.light ? ImageManger.bodySebhaLight : ImageManger.bodySebhaDark),
                  ),
                ),
              ],
            ),
             SizedBox(
              height: size.height * 0.015,
            ),
            Text( AppLocalizations.of(context)!.numbersebha, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),),
            
             SizedBox(
              height: size.height * 0.04,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18 , vertical: 12),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(23),
              ),
              child: Text(counter.toString() , style: theme.textTheme.titleMedium,),
            ),
             SizedBox(
              height: size.height * 0.05,
            ),
            InkWell(
              onTap: azkarClick,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18 , vertical: 8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text('${azkar[index]} ', style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.surface
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }

  void azkarClick() {
    angle += 0.30;
    if(counter < 33){
      counter++;
    }
    else{
      counter =0;
      index++;
      if (index == azkar.length) {
        index =0;
      }
    }
    setState(() {
      
    });
  }
}