//https://newsapi.org
// /v2/everything?
// q=tesla&apiKey=c032a8fd3b194f709479cb3d9d27fdd1


import 'package:messanger_flutter/Shared/components/components.dart';
import 'package:messanger_flutter/Shared/network/local/cash_helper.dart';
import 'package:messanger_flutter/modules/shop_app/Login/Login.dart';

void sign_out (context)
{
  CachHelper.clear(key: 'token') ;
  Navigatetoandremove(context, ShopLoginScreen()) ;
}
String token='' ;
String uID;