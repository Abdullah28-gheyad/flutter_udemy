
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/components/components.dart';
import 'package:messanger_flutter/Shared/cubit/cubit.dart';
import 'package:messanger_flutter/layout/newsapp/cubit/states.dart';
import 'package:messanger_flutter/modules/news_app/Search/SearchScreen.dart';
import 'cubit/cubit.dart';
class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
     listener: (context , state)=>{},
      builder: (context , state)
      {
        NewsCubit cubit = BlocProvider.of(context) ;
        return Scaffold(
            appBar:AppBar(
              title: Text(
                  'News App'
              ),
              actions: [
                IconButton(onPressed: (){
                  Navigateto(context, SearchScreen()) ;
                }, icon: Icon(Icons.search)),
                IconButton(onPressed: (){
                  Appcubit.get(context).change_app_mode() ;
                }, icon: Icon(Icons.brightness_4_outlined))
              ],
            ) ,
            body: cubit.screens[cubit.current_index],
            bottomNavigationBar:BottomNavigationBar(items: cubit.bottom_items,
            currentIndex: cubit.current_index,
            onTap: (index)
              {
                cubit.change_index(index);
              },)


        );
      },
    );
  }
}
