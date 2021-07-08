import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/cubit/cubit.dart';
import 'package:messanger_flutter/Shared/cubit/states.dart';
import 'package:messanger_flutter/Shared/network/local/cash_helper.dart';
import 'package:messanger_flutter/Shared/network/remote/dio_helper.dart';
import 'package:messanger_flutter/layout/social/cubit/cubit.dart';
import 'package:messanger_flutter/layout/social/social_layout.dart';
import 'package:messanger_flutter/modules/shop_app/Login/Login.dart';
import 'package:messanger_flutter/modules/social_app/social_login_screen/social_screen.dart';
import 'Shared/components/constants.dart';
import 'Shared/Styles/thems.dart';
import 'Shared/bloc_observer.dart';
import 'layout/newsapp/cubit/cubit.dart';
import 'layout/shoplayout/cubit/cubit.dart';

Widget widget ;
void main() async {
  WidgetsFlutterBinding.ensureInitialized() ;
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  DioHelper.init()  ;
  await CachHelper.init() ;
  bool is_dark  = CachHelper.getData(key: 'isDark') ;
  bool onboarding  = CachHelper.getData(key: 'onBoarding') ;
  String tooken  = CachHelper.getData(key: 'token') ;
  if (CachHelper.getData(key: 'u_id')!=null)
    {
      uID  = CachHelper.getData(key: 'u_id') ;
    }
  else
    {
      uID=" " ;
    }

  token=CachHelper.getData(key: 'token') ;
  // if (onboarding!=null) {
  //   if (tooken!=null)
  //     widget = ShopLayout();
  //   else
  //     widget=ShopLoginScreen() ;
  // }
  // else
  //   widget = on_boarding_screen() ;
  if(uID==" "||uID == null)
    {
      widget = social_login_screen() ;
    }
  else
    {
      widget = SocialLayout() ;
    }

  print (onboarding) ;
  runApp(MyApp(is_dark,onboarding));
}
class MyApp extends StatelessWidget
{
  final bool is_dark  ;
  final bool on_boarding  ;
  MyApp(this.is_dark, this.on_boarding) ;
  @override
  Widget build(BuildContext context) {
   return MultiBlocProvider(
     providers: [
       BlocProvider(create: (context)=>NewsCubit()..get_business()..get_sports()..get_science(),
       ), 
       BlocProvider( create: (BuildContext context) =>Appcubit()..change_app_mode(
           from_shared: is_dark
       ),),
       BlocProvider( create: (BuildContext context) =>shop_cubit()..get_home_data()..get_gategory_data()..get_favorite()..get_profile() , ),
       BlocProvider( create: (BuildContext context) =>SocialCubit()..getUserData()..getPosts()),
     ],
     child: BlocConsumer<Appcubit , App_states>(
        listener: (context , states)=>{},
       builder: (context , states)=>MaterialApp(
         theme: ligth_theme ,
         darkTheme: dark_theme,
         themeMode: ThemeMode.light,
         debugShowCheckedModeBanner: false,

         home:ShopLoginScreen(),
       ),
     ),
   );
}
}
