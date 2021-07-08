

import 'package:messanger_flutter/models/Shopapp/Shopapp_login/shoplogin.dart';

abstract class ShopLoginStates {}

class ShopLoginInitialState extends ShopLoginStates {}
class ShopLoginLoadingState extends ShopLoginStates {}
class ShopLoginSuccessState extends ShopLoginStates {
  final ShopLoginmodel loginmodel ;

  ShopLoginSuccessState(this.loginmodel);

}
class ShopLoginErrorState extends ShopLoginStates {
  final String error ;
  ShopLoginErrorState(this.error);
}