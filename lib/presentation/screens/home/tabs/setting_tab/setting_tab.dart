import 'package:flutter/material.dart';
import 'package:islamiii_app/core/colors_manger.dart';
import 'package:islamiii_app/providers/setting_provider.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
        SwitchListTile(
          inactiveThumbColor: ColorsManger.white,
          activeColor: ColorsManger.gold,
          inactiveTrackColor: ColorsManger.primarylight,
          title: Text('ThemeAPP' , style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
            fontWeight: FontWeight.w600,
          ),),
        value: provider.isDark,
         onChanged: (value){
          provider.themeAppMode(value ? ThemeMode.dark : ThemeMode.light);
         }),
         ListTile(
          title: Text('Language', style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
            fontWeight: FontWeight.w600,),),
            trailing: DropdownButtonHideUnderline(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary ,
                  border: Border.all(color: Theme.of(context).colorScheme.onSurface,
                  width: 2),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: DropdownButton<String>(
                  dropdownColor: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(15),
                  value: provider.appLang,
                  items: [
                    DropdownMenuItem(
                      value: 'en',
                      child: Text('English' ,style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 18,) )),
                      DropdownMenuItem(
                        value: 'ar',
                        child: Text('العربيه' , style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 18,
                        ),))
                  ],
                  onChanged: (value){
                    provider.languageApp(value ?? 'en') ;
                  }),
              ),
            ),
         )
      ],),
    );
  }
}