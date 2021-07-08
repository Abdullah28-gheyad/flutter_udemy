

import 'package:messanger_flutter/models/Shopapp/Shopapp_login/shoplogin.dart';

abstract class ShopRegisterStates {}

class ShopRegisterInitialState extends ShopRegisterStates {}
class ShopRegisterLoadingState extends ShopRegisterStates {}
class ShopRegisterSuccessState extends ShopRegisterStates {
  final ShopLoginmodel Risgister_model ;

  ShopRegisterSuccessState(this.Risgister_model);

}
class ShopRegisterErrorState extends ShopRegisterStates {
  final String error ;
  ShopRegisterErrorState(this.error);
}