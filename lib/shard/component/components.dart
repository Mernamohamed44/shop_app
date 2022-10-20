import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/moduls/login.dart';
import 'package:shop_app/models/onboarding_model.dart';
import 'package:shop_app/network/local/shared_pref.dart';
import 'package:shop_app/style/colors.dart';

import '../../models/favorite_model.dart';

Widget buildOnBoarding(OnBoardingModel model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image.asset('${model.image}'),
      ),
      Text(model.name),
      const SizedBox(
        height: 10,
      ),
      Text('${model.title}'),
    ],
  );
}

navigatePushReplacement(context,w) {
  return Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (ctx) => w), (route) => false);
}
navigateTo(context,widget){
 return Navigator.push(context,MaterialPageRoute(builder:(context){
    return widget;
  }));
}
Widget defaultTextField(
    {String? txt,
    IconData? prefixIcon,
    IconData? suffixIcon,
    Function? validate,
    Function? suffixOnPress,
    bool isPass = false,
    TextInputType? type,
    TextEditingController? controller,
    onSubmit}) {
  return TextFormField(
    controller: controller,
    onFieldSubmitted:onSubmit,
    keyboardType: type,
    obscureText: isPass ? true : false,
    validator: (value) => validate!(value),
    decoration: InputDecoration(
      prefixIcon: Icon(prefixIcon),
      suffixIcon: IconButton(
        icon: Icon(suffixIcon),
        onPressed: () {
          if (suffixIcon != null) {
            suffixOnPress!();
          }
        },
      ),
      label: Text('$txt'),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
    ),
  );
}

Widget defaultButton({String? txt, Function? onPress}) {
  return MaterialButton(
      minWidth: 350,
      height: 50,
      color: defaultColor,
      child: Text('$txt'),
      onPressed: () => onPress!());
}
void showToast({
  @required message,
  @required ToastState ?state
}){
  Fluttertoast.showToast(
      msg: message ,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state!),
      textColor: Colors.white,
      fontSize: 16.0
  );
}
enum ToastState{success,error,warning}
Color chooseToastColor(ToastState state)
{
  Color color;
  switch(state)
  {
    case ToastState.success:
      color=Colors.green;
      break;
    case ToastState.error:
      color=Colors.red;
      break;
    case ToastState.warning:
      color=Colors.amber;
      break;
  }
  return color;
}
 logOut(context){
   return CacheHelper.clearData(key: 'token').then((value) =>navigatePushReplacement(context, Login()) );
}
 Widget buildFavorite(model,context){
  return Container(
    height: 120,
    child: Row(
      children: [
        Stack(
            alignment: AlignmentDirectional.bottomStart,
            children:[
              Image(image: NetworkImage(model!.image),
                width: 120,
                height: 120,
              ),
              if(model.discount!=0)
                Container(
                    color: Colors.red,
                    child: Text('Discount',style: TextStyle(color: Colors.white),))
            ] ),
        SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.name
                ,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14,
                    height: 1.4
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    '${model.price}' ,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(width: 5,),
                  if(model.discount!=0)
                    Text(
                      '${model.oldPrice}' ,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          decoration: TextDecoration.lineThrough
                      ),
                    ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor:ShopAppCubit.get(context).favorites[model.id]? Colors.blue:Colors.grey,
                    child: IconButton(
                        onPressed: (){
                          ShopAppCubit.get(context).changeFavorite(model.id);
                          //   print(productModel.id);
                        }, icon:Icon(
                      Icons.favorite_border,size: 18,color:Colors.white ,)),
                  )
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}