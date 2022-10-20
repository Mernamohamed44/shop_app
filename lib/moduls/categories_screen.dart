import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/state.dart';
import 'package:shop_app/models/categories_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopAppState>(
      listener: (context,state){},
    builder: (context,state) {
        var catemodel=ShopAppCubit.get(context).categoriesModel;
      return ListView.separated(
          itemBuilder: (context, index) => buildCateItem(catemodel!.data?.data[index]),
          separatorBuilder: (context, index) => Divider(height: 20),
          itemCount:catemodel!.data!.data.length );
    });
    }
  }
  Widget buildCateItem(Datum? model){
    return Row(
      children: [
        Image(
            height: 150,
            width: 150,
            image: NetworkImage(model!.image)),
        SizedBox(width: 15,),
        Text(model.name),
        Spacer(),
        Icon(Icons.arrow_forward_ios)
      ],
    ) ;
}