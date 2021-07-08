import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/network/remote/dio_helper.dart';
import 'package:messanger_flutter/layout/newsapp/cubit/states.dart';
import 'package:messanger_flutter/modules/news_app/business/businessscreen.dart';
import 'package:messanger_flutter/modules/news_app/science/scinecescreen.dart';
import 'package:messanger_flutter/modules/news_app/sports/sportscreen.dart';


class NewsCubit extends Cubit <NewsStates>
{

  NewsCubit():super(NewsInitialstate()) ;
  static NewsCubit get (context)=>BlocProvider.of(context) ;
  int current_index = 0 ;
  List<BottomNavigationBarItem> bottom_items = [
    BottomNavigationBarItem(icon:Icon(Icons.business) , label: 'Business' ) ,
    BottomNavigationBarItem(icon:Icon(Icons.sports) , label: 'Sports' ) ,
    BottomNavigationBarItem(icon:Icon(Icons.science) , label: 'Science' ) ,
  ];
  void change_index (int index)
  {
    this.current_index = index ;
    if (index==1)
      get_sports() ;
    if (index==2)
      get_science() ;
    emit(NewsBottomNavState()) ;
    
  }
  List<Widget> screens = [
    new BusinessScreen() ,new SportScreen() ,new ScienceScreen()
  ];

  List<dynamic> business =[] ;
  void get_business()
  {

    emit(NewsGetBusinessLoadingState());

    if (business.length==0)
      {
        DioHelper.get(
            url: 'v2/top-headlines',
            query: {
              'country':'eg'
              ,'category':'business'
              ,'apiKey':'c032a8fd3b194f709479cb3d9d27fdd1'
            }).then((value) {
          // print(value.data.toString()) ;
          business = value.data['articles'] ;
          print (business[0]['title']) ;
          emit(NewsGetBusinessSuccessState()) ;
        }).catchError((error){
          print (error.toString()) ;
          emit(NewsGetBusinessEroorState(error.toString())) ;
        });
      }
    else
      {
        emit(NewsGetBusinessSuccessState()) ;
      }
  }


  List<dynamic> sports =[] ;
  void get_sports()
  {
    emit(NewsGetSportsLoadingState());
    if (sports.length==0)
    {
      DioHelper.get(
          url: 'v2/top-headlines',
          query: {
            'country':'eg'
            ,'category':'sports'
            ,'apiKey':'c032a8fd3b194f709479cb3d9d27fdd1'
          }).then((value) {
        // print(value.data.toString()) ;
        sports = value.data['articles'] ;
        print (sports[0]['title']) ;
        emit(NewsGetSportsSuccessState()) ;
      }).catchError((error){
        print (error.toString()) ;
        emit(NewsGetSportsEroorState(error.toString())) ;
      });
    }
    else
    {
      emit(NewsGetSportsSuccessState()) ;
    }
  }



  List<dynamic> Science =[] ;
  void get_science()
  {
    emit(NewsGetScineceLoadingState());
    if (Science.length==0)
      {
        DioHelper.get(
            url: 'v2/top-headlines',
            query: {
              'country':'eg'
              ,'category':'science'
              ,'apiKey':'c032a8fd3b194f709479cb3d9d27fdd1'
            }).then((value) {
          // print(value.data.toString()) ;
          Science = value.data['articles'] ;
          print (Science[0]['title']) ;
          emit(NewsGetScienceSuccessState()) ;
        }).catchError((error){
          print (error.toString()) ;
          emit(NewsGetScienceEroorState(error.toString())) ;
        });
      }
    else
      {
        emit(NewsGetScienceSuccessState()) ;
      }

  }
  



  List<dynamic> Search =[] ;
  void get_search(String value)
  {

    emit(NewsGetScineceLoadingState());
    Search = [] ;
    DioHelper.get(
        url: 'v2/everything',
        query: {
          'q':'$value'
          ,'apiKey':'c032a8fd3b194f709479cb3d9d27fdd1'
        }).then((value) {
      // print(value.data.toString()) ;
      Search = value.data['articles'] ;
      print (Science[0]['title']) ;
      emit(NewsGetSearchSuccessState()) ;
    }).catchError((error){
      print (error.toString()) ;
      emit(NewsGetSearchEroorState(error.toString())) ;
    });

  }
}