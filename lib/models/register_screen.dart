import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/state.dart';
import 'package:shop_app/layout/Shop_layout.dart';
import 'package:shop_app/network/local/shared_pref.dart';
import 'package:shop_app/shard/component/components.dart';
import 'package:shop_app/shard/constants.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var formKey=GlobalKey<FormState>();
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var passWordController=TextEditingController();
  var phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=>ShopAppCubit(context),
        child: BlocConsumer<ShopAppCubit,ShopAppState>(
          listener: (context,state){
            if(state is SuccessRegisterState) {
              if(state.loginModel!.status){
                CacheHelper.saveData(key: 'token', value:state.loginModel?.data?.token).then(
                        (value){
                      token=state.loginModel?.data?.token;
                      navigatePushReplacement(context, ShopLayout());
                    } );
              }
              else{
                showToast(message:state.loginModel?.message , state:ToastState.error);
              }
            }
          },
          builder: (context,state){
            var cubit=ShopAppCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white.withOpacity(.2),
                elevation: 0,
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Register',style:Theme.of(context).textTheme.headline3?.copyWith(
                              color: Colors.black
                          ),),
                          Text('Register now to browse our hot offers',style:Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.grey
                          ),),
                          const SizedBox(height:30,),
                          defaultTextField(
                            controller: nameController,
                            type: TextInputType.text,
                            txt: 'Name',
                            prefixIcon:Icons.person_outline,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Name must not null';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height:15,),
                          defaultTextField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            txt: 'email',
                            prefixIcon:Icons.email_outlined,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'email must not null';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15,),
                          defaultTextField(
                              controller: passWordController,
                              txt: 'Password',
                              type: TextInputType.visiblePassword,
                              isPass: cubit.isPass,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'password is too short';
                                }
                                return null;
                              },
                              suffixIcon: cubit.suffix,
                              suffixOnPress: (){
                                cubit.changeVisibilityPassword();
                              },
                              prefixIcon: Icons.lock_outline
                          ),
                          const SizedBox(height: 15,),
                          defaultTextField(
                              controller: phoneController,
                              txt: 'Phone',
                              type: TextInputType.phone,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'password is too short';
                                }
                                return null;
                              },
                              prefixIcon: Icons.phone_outlined
                          ),
                          const SizedBox(height: 20,),
                          ConditionalBuilder(condition: state is! LoadingRegisterState ,
                              builder: (context)=>Center(child: defaultButton(txt: 'Register',onPress:(){
                                if(formKey.currentState!.validate()){
                                  cubit.userRegister(
                                    name: nameController.text,
                                      email:emailController.text,
                                      password: passWordController.text,
                                      phone: phoneController.text
                                  );
                                }
                              })),fallback: (context)=>const Center(child: CircularProgressIndicator(),))
                          ,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );},
        ));
  }
}
