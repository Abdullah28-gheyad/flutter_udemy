

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/network/endpoints.dart';
import 'package:messanger_flutter/Shared/network/remote/dio_helper.dart';
import 'package:messanger_flutter/models/Shopapp/Shopapp_login/shoplogin.dart';

import 'package:messanger_flutter/modules/shop_app/Login/cubit/states.dart';

class shop_app_login_cubit extends Cubit <ShopLoginStates> {
  shop_app_login_cubit():super(ShopLoginInitialState()) ;
  static shop_app_login_cubit get (context)=>BlocProvider.of(context) ;
  ShopLoginmodel loginmodel ;
  void User_login (
  {
  @required String email ,
    @required String password
}
      )
  {
    emit(ShopLoginLoadingState()) ;
    DioHelper.post_Data(
        url: LOGIN,
        data:{
          'email':'$email' ,
          'password':'$password'
        }).then((value) 
    {
      loginmodel =  ShopLoginmodel.FromJson(value.data) ;
         print (loginmodel.status) ;
        print (loginmodel.message) ;
         print (loginmodel.data.token) ;
        emit(ShopLoginSuccessState(loginmodel)) ;

    }).catchError((error){
      emit(ShopLoginErrorState(error.toString()));
    }) ;
  }
}