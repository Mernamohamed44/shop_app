import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/state.dart';
import 'package:shop_app/models/favorite_model.dart';
import 'package:shop_app/shard/component/components.dart';

class FAVScreen extends StatelessWidget {
  const FAVScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopAppState>(
        listener: (context,state){},
        builder: (context,state) {
          var cubit=ShopAppCubit.get(context).favoritesModel;
          return ConditionalBuilder(
              condition:state is! LoadingGetFavoritesState ,
              builder: (context)=>ListView.separated(
                  itemBuilder: (context, index) =>buildFavorite(cubit?.data!.data[index].product,context),
                  separatorBuilder: (context, index) => Divider(height: 20),
                  itemCount:cubit!.data!.data.length),
              fallback:(context)=>Center(child: CircularProgressIndicator()));
        });
  }

}