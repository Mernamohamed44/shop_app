
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/state.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/chnagefav_model.dart';
import 'package:shop_app/models/favorite_model.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/models/search_model.dart';
import 'package:shop_app/moduls/categories_screen.dart';
import 'package:shop_app/moduls/fav_screen.dart';
import 'package:shop_app/moduls/product_screen.dart';
import 'package:shop_app/moduls/settings_screen.dart';
import 'package:shop_app/network/remote/dio_helper.dart';
import 'package:shop_app/shard/constants.dart';

class ShopAppCubit extends Cubit<ShopAppState> {
  ShopAppCubit(context) : super(InitialState());
  static ShopAppCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;
  userLogin({@required String? email, @required String? password}) {
    emit(LoadingLoginState());
    DioHelper.postData(
        url: 'login',
        data: {'email': email, 'password': password}).then((value) {
      loginModel = LoginModel.fromJson(value?.data);
      print(value?.data);
      emit(SuccessLoginState(loginModel));
    }).catchError((error) {
      print('Error${error.toString()}');
      emit(ErrorLoginState(error.toString()));
    });
  }
  LoginModel? registerUser;
  userRegister({@required String? name,@required String? email, @required String? password,@required String? phone}) {
    emit(LoadingRegisterState());
    DioHelper.postData(
        url: 'register',
        data: {
          'name':name,
          'email': email,
          'password': password,
          'phone':phone
        }).then((value) {
      registerUser = LoginModel.fromJson(value?.data);
      print(value?.data);
      emit(SuccessRegisterState(registerUser));
    }).catchError((error) {
      print('Error${error.toString()}');
      emit(ErrorRegisterState(error.toString()));
    });
  }


  IconData suffix = Icons.remove_red_eye_outlined;
  bool isPass = true;
  changeVisibilityPassword() {
    isPass = !isPass;
    suffix =
        isPass ? Icons.remove_red_eye_outlined : Icons.visibility_off_outlined;
    emit(ChangeVisibilityPassword());
  }

  int currentIndex = 0;
  changeBottomNav(index) {
    currentIndex = index;
    emit(ChangeNavBottom());
  }

  List Screen = [
    HomeScreen(),
    CategoriesScreen(),
    FAVScreen(),
    SettingsScreen()
  ];
  HomeModel? homeModel;
  Map favorites = {};
  getHomeData() {
    emit(LoadingHomeDataState());
    DioHelper.getData(url: 'home', token: token).then((value) {
      homeModel = HomeModel.fromJson(value!.data);
      homeModel?.data?.products.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
      });
      print(favorites);
      print(homeModel?.data?.banners[0].image);
      emit(SuccessHomeDataState());
    }).catchError((error) {
      print('Error :${error.toString()}');
      emit(ErrorHomeDataState());
    });
  }

  CategoriesModel? categoriesModel;
  getCategoriesData() {
    emit(LoadingCategoriesDataState());
    DioHelper.getData(url: 'categories', token: token).then((value) {
      categoriesModel = CategoriesModel.fromJson(value!.data);
      print(categoriesModel?.data?.data[0].name);
      emit(SuccessCategoriesDataState());
    }).catchError((error) {
      print('Error :${error.toString()}');
      emit(ErrorCategoriesDataState());
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;
  void changeFavorite(productId) {
    favorites[productId]=!favorites[productId];
    emit(SuccessFavoritesDataState());
    DioHelper.postData(
            url: 'favorites', data: {'product_id': productId}, token: token)
        .then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value!.data);
      print(changeFavoritesModel?.data?.id);
      if(!changeFavoritesModel!.status)
      {
        favorites[productId]=!favorites[productId];
      }
      else{
        getFavoritesData();
      }
      emit(SuccessFavoritesDataState());
    }).catchError((error) {
      favorites[productId]=!favorites[productId];
      print(error.toString());
      emit(ErrorFavoritesDataState());
    });
  }
  FavoritesModel? favoritesModel;
 void getFavoritesData() {
    emit(LoadingGetFavoritesState());
    DioHelper.getData(url: 'favorites', token: token).then((value) {
      favoritesModel=FavoritesModel.fromJson(value!.data);
      print(favoritesModel!.data!.data[0].product?.name);
      emit(SuccessGetFavoritesState());
    }).catchError((error) {
      print('Error :${error.toString()}');
      emit(ErrorGetFavoritesState());
    });
  }
   LoginModel? userData;
  void getSettingsData() {
    emit(LoadingGetUserDataState());
    DioHelper.getData(url: 'profile', token: token).then((value) {
      userData= LoginModel.fromJson(value!.data);
      print(userData?.data?.email);
      emit(SuccessGetUserDataState());
    }).catchError((error) {
      print('Error :${error.toString()}');
      emit(ErrorGetUserDataState());
    });
  }
  void updateUser({@required String? name,@required String? email,@required String? phone}) {
    emit(LoadingUpdateUserDataState());
    DioHelper.putData(
        url: 'update-profile',
        data: {
          'name':name,
          'email': email,
          'phone':phone
        },
        token: token
    ).then((value) {
      userData = LoginModel.fromJson(value?.data);
      print(value?.data);
      emit(SuccessUpdateUserDataState());
    }).catchError((error) {
      print('Error${error.toString()}');
      emit(ErrorUpdateUserDataState());
    });
  }
  SearchModel? searchModel;
  search(
      {@required String?text,}) {
    emit(LoadingSearchState());
    DioHelper.postData(
        url: 'products/search',
        data: {
          'text':text,
        }).then((value) {
     searchModel= SearchModel.fromJson(value?.data);
      print(value?.data);
      emit(SuccessSearchState());
    }).catchError((error) {
      print('Error${error.toString()}');
      emit(ErrorSearchState());
    });
  }
}
