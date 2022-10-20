import 'package:shop_app/models/login_model.dart';

abstract class ShopAppState {}

class InitialState extends ShopAppState {}

class LoadingLoginState extends ShopAppState {}

class SuccessLoginState extends ShopAppState {
  LoginModel? loginModel;
  SuccessLoginState(this.loginModel);
}

class ErrorLoginState extends ShopAppState {
  final String? error;

  ErrorLoginState(this.error);
}

class ChangeVisibilityPassword extends ShopAppState {}

class ChangeNavBottom extends ShopAppState {}

class LoadingHomeDataState extends ShopAppState {}

class SuccessHomeDataState extends ShopAppState {}

class ErrorHomeDataState extends ShopAppState {}

class LoadingCategoriesDataState extends ShopAppState {}

class SuccessCategoriesDataState extends ShopAppState {}

class ErrorCategoriesDataState extends ShopAppState {}

class SuccessFavoritesDataState extends ShopAppState {}

class ErrorFavoritesDataState extends ShopAppState {}

class SuccessGetFavoritesState extends ShopAppState {}

class LoadingGetFavoritesState extends ShopAppState {}

class ErrorGetFavoritesState extends ShopAppState {}

class SuccessGetUserDataState extends ShopAppState {}

class LoadingGetUserDataState extends ShopAppState {}

class ErrorGetUserDataState extends ShopAppState {}

class LoadingRegisterState extends ShopAppState {}

class SuccessRegisterState extends ShopAppState {
  LoginModel? loginModel;
  SuccessRegisterState(this.loginModel);
}

class ErrorRegisterState extends ShopAppState {
  final String? error;

  ErrorRegisterState(this.error);
}
class SuccessUpdateUserDataState extends ShopAppState {
}
class LoadingUpdateUserDataState extends ShopAppState {}

class ErrorUpdateUserDataState extends ShopAppState {}
class SuccessSearchState extends ShopAppState {
}
class LoadingSearchState extends ShopAppState {}

class ErrorSearchState extends ShopAppState {}
