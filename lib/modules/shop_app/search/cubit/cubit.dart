import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/components/constants.dart';
import 'package:messanger_flutter/Shared/network/endpoints.dart';
import 'package:messanger_flutter/Shared/network/remote/dio_helper.dart';
import 'package:messanger_flutter/models/Shopapp/search_model/Search_model.dart';
import 'package:messanger_flutter/modules/shop_app/search/cubit/states.dart';

class Search_cubit extends Cubit<Search_states>
{
  Search_cubit():super(search_initial_state()) ;
  static Search_cubit get(context)=>BlocProvider.of(context) ;
  Search_Model search_model ;
  void Search(String text)
  {


    emit(  search_loading_state());
    DioHelper.post_Data(
        token: token
        ,url: SEARCH, data: {
      'text':text,
    }).then((value) {
  search_model = Search_Model.fromJson(value.data) ;
  emit(search_success_state ());
    }).catchError((onError){
      print(onError.toString()) ;
      emit(search_error_state()) ;
    });
  }
}