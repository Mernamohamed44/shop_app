import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/state.dart';
import 'package:shop_app/moduls/search_screen.dart';
import 'package:shop_app/shard/component/components.dart';


class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=>ShopAppCubit(context)..getHomeData()..getCategoriesData()..getFavoritesData()..getSettingsData(),
    child: BlocConsumer<ShopAppCubit,ShopAppState>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=ShopAppCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white.withOpacity(.2),
              elevation: 0,
              title: const Text('Salla',style: TextStyle(color: Colors.black),),
              actions: [
                IconButton(onPressed:(){navigateTo(context,SearchScreen());}, icon:Icon(Icons.search,color: Colors.black))
              ],
            ),
            body:cubit.Screen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.deepOrange,
            showUnselectedLabels: true,
            currentIndex: cubit.currentIndex,
            onTap:(index){
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.apps),label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: 'Favorite'),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings')
            ],
          ),
        );
      },
      
    ),);
  }
}
