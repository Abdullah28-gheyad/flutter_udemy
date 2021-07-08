import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData dark_theme = ThemeData(
    scaffoldBackgroundColor:HexColor('333739') ,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('333739') ,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor:HexColor('333739'),
        elevation: 0.0 ,
        titleTextStyle: TextStyle(color: Colors.white ,
            fontSize: 20.0 , fontWeight: FontWeight.bold)
    ),
    bottomNavigationBarTheme:BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed ,
        backgroundColor: HexColor('333739') ,
        elevation: 20.0 ,
        unselectedItemColor: Colors.grey ,
        selectedItemColor: Colors.blue

    )
    , textTheme: TextTheme(
    bodyText1: TextStyle(
        fontSize: 18 , fontWeight: FontWeight.bold ,
        color: Colors.white
    )
)
);
ThemeData ligth_theme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
          color: Colors.black
      ),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white
      ),
      backgroundColor: Colors.white,
      elevation: 0.0 ,
      titleTextStyle: TextStyle(color: Colors.black ,
          fontSize: 20.0 , fontWeight: FontWeight.bold)
  ),
  bottomNavigationBarTheme:BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed ,
      backgroundColor: Colors.white ,
      elevation: 20.0 ,
      unselectedItemColor: Colors.grey ,
      selectedItemColor: Colors.blue

  )
  ,textTheme: TextTheme(
    bodyText1: TextStyle(
        fontSize: 18 , fontWeight: FontWeight.bold ,
        color: Colors.black
    )
),) ;