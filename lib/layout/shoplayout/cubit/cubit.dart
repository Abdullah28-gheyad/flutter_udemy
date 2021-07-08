

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/components/constants.dart';
import 'package:messanger_flutter/Shared/network/endpoints.dart';
import 'package:messanger_flutter/Shared/network/remote/dio_helper.dart';
import 'package:messanger_flutter/layout/shoplayout/cubit/states.dart';
import 'package:messanger_flutter/models/Shopapp/Category/category.dart';
import 'package:messanger_flutter/models/Shopapp/Favorites_model/favourites_model.dart';
import 'package:messanger_flutter/models/Shopapp/Homemodel/Home_model.dart';
import 'package:messanger_flutter/models/Shopapp/Shopapp_login/shoplogin.dart';
import 'package:messanger_flutter/models/Shopapp/add_favorite/Add_favorite_model.dart';
import 'package:messanger_flutter/models/user_model/user_model.dart';
import 'package:messanger_flutter/modules/shop_app/categories/Categories.dart';
import 'package:messanger_flutter/modules/shop_app/favourites/favourits.dart';
import 'package:messanger_flutter/modules/shop_app/products/Product_screen.dart';
import 'package:messanger_flutter/modules/shop_app/settings/Setting.dart';


class shop_cubit extends Cubit <Shopappstates>
{
  shop_cubit () :super(shop_initial_state()) ;
  static shop_cubit get(context)=>BlocProvider.of(context) ;
  int current_index = 0 ;
  List<Widget> shop_screens = <Widget>
  [
    Product_screen() ,
    Category_screen() ,
    Favourit_screen() ,
    Setting_screen()
  ];
  void changebutton (int index)
  {
    current_index = index ; 
    emit(shop_change_button_nav_state());
  }
  HomeModel home_model ;
  Map<int , bool> favourites = {} ;
  void get_home_data ()
  {
    emit(shop_loading_home_data_state()) ;
    DioHelper.get(url: HOME, query: null , token: token,).then((value) {
     home_model=  HomeModel.fromJson(value.data) ;
      print (home_model.data.products[0].image);
      print (token) ;
      home_model.data.products.forEach((element) {
        favourites.addAll({
          element.id:element.inFavorites
        });
      });

      print(favourites.toString()) ;
      emit(shop_succcess_home_data_state())  ;

    }).catchError((onError){
      print (onError.toString());
      emit(shop_error_home_data_state())  ;
    }) ;
  }

  Categories_model category_model ;
  void get_gategory_data ()
  {
    emit(shop_loading_home_data_state()) ;
    DioHelper.get(url: CATEGORY, query: null , token: token,).then((value) {
      category_model=  Categories_model.fromJson(value.data) ;
      emit(shop_succcess_category_data_state())  ;

    }).catchError((onError){
      print (onError.toString());
      emit(shop_error_category_data_state())  ;
    }) ;
  }

  Change_favourite_model change_favourite_model ;
  Color circle_background_color ;
  void change_favorites (int product_id)
  {
    favourites[product_id]=!favourites[product_id] ;
    emit(shop_succcess_change_data_state()) ;
    DioHelper.post_Data(
        url: FAVORITE,
        token: token,
        data: {
          'product_id':product_id,
        }
    ).then((value)
    {
      change_favourite_model = Change_favourite_model.fromjson(value.data);
      print (value.data) ;
      circle_background_color = Colors.blue;
      if (!change_favourite_model.status) {
        favourites[product_id] = !favourites[product_id];

      }
      else
        get_favorite();

      emit(shop_succcess_favourite_data_state(change_favourite_model)) ;

    })
        .catchError((onError){
      favourites[product_id]=!favourites[product_id] ;
      emit(shop_error_favourite_data_state()) ;
    });
  }


  Favorites_Model favorites_model ;
  void get_favorite ()
  {
    emit(shop_loading_getfavorite_data_state()) ;
    DioHelper.get(url: FAVORITE, query: null , token: token,).then((value) {
      favorites_model=  Favorites_Model.fromJson(value.data) ;
      emit(shop_succcess_getfav_data_state())  ;

    }).catchError((onError){
      print (onError.toString());
      emit(shop_error_getfav_data_state())  ;
    }) ;
  }

  ShopLoginmodel user_model ;
  void get_profile () {
    emit(shop_loading_getProfile_data_state()) ;
    DioHelper.get(url: PROFILE, query: null , token: token,).then((value) {
      user_model=  ShopLoginmodel.FromJson(value.data) ;
      emit(shop_succcess_getProfile_data_state())  ;
      print(user_model.data.name) ;
    }).catchError((onError){
      print (onError.toString());
      emit(shop_error_getProfile_data_state())  ;
    }) ;
  }

  void update_profile (
  {
  @required String name,
  @required String email,
  @required String phone,
}
      )
  {
    emit(shop_loading_update_data_state()) ;
    DioHelper.Put_Data(url:UPDATE, query: null , token: token,data: {
      'name':name ,
      'email':email ,
      'phone':phone
    }).then((value) {
      user_model=  ShopLoginmodel.FromJson(value.data) ;
      emit(shop_succcess_update_data_state(user_model))  ;
      print(user_model.data.name) ;
    }).catchError((onError){
      print (onError.toString());
      emit(shop_error_update_data_state())  ;
    }) ;
  }


}