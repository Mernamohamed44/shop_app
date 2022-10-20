import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/state.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/home_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopAppState>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=ShopAppCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.homeModel!=null && cubit.categoriesModel!=null ,
          builder:(context)=>buildProduct(cubit.homeModel,context,cubit.categoriesModel),
          fallback:(context)=> Center(child: CircularProgressIndicator()) ,
        );
      },
    );}
    Widget buildProduct(HomeModel? model ,context,CategoriesModel? categoriesModel){
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(items:ShopAppCubit.get(context).homeModel?.data?.banners.map((e) =>
              Image(image: NetworkImage('${e.image}'),
                width: double.infinity,
                fit: BoxFit.cover,),
          ).toList(), options: CarouselOptions(
              height: 250,
              initialPage: 0,
              enableInfiniteScroll: true,
              viewportFraction: 1,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal
          )),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Categories',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder:(context,index)=> buildCategories(categoriesModel!.data!.data[index]), separatorBuilder:(context,index)=>SizedBox(width: 10,) ,itemCount: categoriesModel!.data!.data.length),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('New Products',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),)
              ],
            ),
          )
          , SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.grey.shade100,
            child: GridView.count(crossAxisCount:2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1/1.59,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(model!.data!.products.length, (index) =>buildGridProduct(model.data!.products[index],context) ),
            ),
          )
        ],
      ),
    );
    }
 Widget buildGridProduct(Product productModel,context){
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children:[
              Image(image: NetworkImage(productModel.image),
            width: double.infinity,
            height: 200,
         ),
              if(productModel.discount!=0)
              Container(
                color: Colors.red,
                  child: Text('Discount',style: TextStyle(color: Colors.white),))
         ] ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModel.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14,
                    height: 1.4
                ),
              ),
              Row(
                children: [
                  Text(
                    '${productModel.price}' ,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(width: 5,),
                  if(productModel.discount!=0)
                   Text(
                    '${productModel.oldPrice}' ,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        decoration: TextDecoration.lineThrough
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: ShopAppCubit.get(context).favorites[productModel.id]?Colors.blue:Colors.grey,
                    child: IconButton(
                        onPressed: (){
                          ShopAppCubit.get(context).changeFavorite(productModel.id);
                          print(productModel.id);
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
 Widget buildCategories(Datum model){
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 130,
          width: 130,
          child: Image(image: NetworkImage('${model.image}'),
            fit: BoxFit.cover,),
        ),
        Container(
            width: 130,
            color: Colors.black.withOpacity(.6),
            child: Text('${model.name}',style: TextStyle(color: Colors.white),maxLines: 1,overflow: TextOverflow.ellipsis,textAlign:TextAlign.center,))
      ],
    );
 }
}
