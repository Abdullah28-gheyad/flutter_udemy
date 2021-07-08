import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
 static Dio dio ;
  static init()
  {
    dio = Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/' ,
      receiveDataWhenStatusError: true ,
    ));
  }

  static Future <Response> get (
 {
  @required String url ,
   @required dynamic query ,
   String lang  = 'en',
   String token
})async
  {
    dio.options.headers=
         {
          'lang':lang ,
          'Authorization':token ,
          'Content-Type':'application/json'
         } ;
    return await dio.get(url , queryParameters:query ) ;
  }


 static Future <Response> post_Data (

     {
       @required String url ,
       dynamic query ,
       @required Map<String,dynamic> data ,
       String lang  = 'ar',
       String token
     })async
 {
   dio.options.headers=
   {
     'lang':lang ,
     'Authorization':token,
     'Content-Type':'application/json'
   } ;
   return await dio.post(
       url ,
       queryParameters:query ,
       data: data


   ) ;}
   static Future <Response> Put_Data (

       {
         @required String url ,
         dynamic query ,
         @required Map<String,dynamic> data ,
         String lang  = 'ar',
          @required String token
       })async
   {
     dio.options.headers=
     {
       'lang':lang ,
       'Authorization':token,
       'Content-Type':'application/json'
     } ;
     return await dio.put(
         url ,
         queryParameters:query ,
         data: data


     ) ;
 }
}