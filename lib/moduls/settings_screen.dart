import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/state.dart';
import 'package:shop_app/shard/component/components.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  var formKey=GlobalKey<FormState>();
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopAppState>(
        listener: (context,state){},
        builder:(context,state){
          var cubit =ShopAppCubit.get(context).userData;
          nameController.text=cubit!.data!.name;
          emailController.text=cubit.data!.email;
          phoneController.text=cubit.data!.phone;
          return ConditionalBuilder(
            condition: cubit!=null,
            builder: (context) =>Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    if(state is LoadingUpdateUserDataState)
                    LinearProgressIndicator(),
                    SizedBox(height: 15,),
                    defaultTextField(
                        txt: 'name',
                        prefixIcon: Icons.person_outline,
                        type: TextInputType.text,
                        controller: nameController,
                        validate: ( String value)
                        {
                          if(value.isEmpty){
                            return 'name must\'t empty';
                          }
                          else{
                            return null;
                          }
                        }
                    ),
                    SizedBox(height: 20,),
                    defaultTextField(
                        txt: 'email',
                        prefixIcon: Icons.email_outlined,
                        type: TextInputType.emailAddress,
                        controller: emailController,
                        validate: ( String value)
                        {
                          if(value.isEmpty){
                            return 'email must\'t empty';
                          }
                          else{
                            return null;
                          }
                        }
                    ),
                    SizedBox(height: 20,),
                    defaultTextField(
                        txt: 'phone',
                        prefixIcon: Icons.phone_outlined,
                        type: TextInputType.phone,
                        controller: phoneController,
                        validate: ( String value)
                        {
                          if(value.isEmpty){
                            return 'phone must\'t empty';
                          }
                          else{
                            return null;
                          }
                        }
                    ),
                    SizedBox(height: 20,),
                    defaultButton(txt: 'UpDate',onPress: (){
                      if(formKey.currentState!.validate())
                      {
                        ShopAppCubit.get(context).updateUser(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,);
                      }
                    }),
                    SizedBox(height: 20,),
                    defaultButton(txt: 'Log Out',onPress: (){
                      logOut(context);
                    }),
                  ],
                ),
              ),
            ),
            fallback: (context) =>Center(child: CircularProgressIndicator()) ,
          );
        },
    );
  }
}