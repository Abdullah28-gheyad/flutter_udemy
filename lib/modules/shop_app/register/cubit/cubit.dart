

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/network/endpoints.dart';
import 'package:messanger_flutter/Shared/network/remote/dio_helper.dart';
import 'package:messanger_flutter/models/Shopapp/Shopapp_login/shoplogin.dart';

import 'package:messanger_flutter/modules/shop_app/Login/cubit/states.dart';
import 'package:messanger_flutter/modules/shop_app/register/cubit/states.dart';

class shop_app_Register_cubit extends Cubit <ShopRegisterStates> {
  shop_app_Register_cubit():super(ShopRegisterInitialState()) ;
  static shop_app_Register_cubit get (context)=>BlocProvider.of(context) ;
  ShopLoginmodel Registermodel ;
  void User_Register (
  {
    @required String name ,
  @required String email ,
    @required String password,
    @required String phone
}
      )
  {
    emit(ShopRegisterLoadingState()) ;
    DioHelper.post_Data(
        url: REGISTER,
        data:{
          'name':'$name' ,
          'email':'$email' ,
          'password':'$password',
          'phone':'$phone' ,
        }).then((value) 
    {
      Registermodel =  ShopLoginmodel.FromJson(value.data) ;
         print (Registermodel.status) ;
        print (Registermodel.message) ;
         print (Registermodel.data.token) ;
        emit(ShopRegisterSuccessState(Registermodel)) ;

    }).catchError((error){
      emit(ShopRegisterErrorState(error.toString()));
    }) ;
  }
}