import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/state.dart';
import 'package:shop_app/shard/component/components.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
   var formKey=GlobalKey<FormState>();
  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>ShopAppCubit(context),
    child: BlocConsumer<ShopAppCubit,ShopAppState>(
        builder:(context,state){
          var cubit=ShopAppCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white.withOpacity(.2),
                elevation: 0,
              ),
              body: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      defaultTextField(
                          txt: 'Search',
                          controller: searchController,
                          prefixIcon: Icons.search_sharp,
                          onSubmit: (String text){
                            cubit.search(text: text);
                          }
                      ), SizedBox(
                        height: 10,
                      ),
                      if(state is LoadingSearchState)
                        LinearProgressIndicator(),
                      if(state is SuccessSearchState)
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) =>buildFavorite(cubit.searchModel!.data!.data[index],context),
                            separatorBuilder: (context, index) => Divider(height: 20),
                            itemCount:cubit.searchModel!.data!.data.length),
                      ),
                    ],
                  ),
                ),
              )
          );} ,
        listener: (context,state){}),);
  }
}