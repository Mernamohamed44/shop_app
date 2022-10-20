import 'package:flutter/material.dart';
import 'package:shop_app/layout/Shop_layout.dart';
import 'package:shop_app/moduls/login.dart';
import 'package:shop_app/moduls/on_boarding.dart';
import 'package:shop_app/network/local/shared_pref.dart';
import 'package:shop_app/shard/constants.dart';

import 'network/remote/dio_helper.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
   DioHelper.init();
  await CacheHelper.init();
   bool onBoarding=CacheHelper.getData(key: 'OnBoarding');
    token=CacheHelper.getData(key: 'token');
    print(token);
   Widget  widget;
   if(onBoarding!=null){
     if(token!=null){
       widget=ShopLayout();
     }
     else{
       widget=Login();
     }
   }else{
     widget=OnBoarding();
   }
   print(onBoarding);
  runApp( MyApp(onBoarding:onBoarding,startWidget: widget,));
}
class MyApp extends StatelessWidget {
 final bool onBoarding;
 final Widget startWidget;
  const MyApp({Key? key, required this.onBoarding, required this.startWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:startWidget
    );
  }
}


