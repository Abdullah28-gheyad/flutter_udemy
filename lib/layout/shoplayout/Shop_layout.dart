import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/components/components.dart';
import 'package:messanger_flutter/Shared/network/local/cash_helper.dart';
import 'package:messanger_flutter/layout/shoplayout/cubit/cubit.dart';
import 'package:messanger_flutter/layout/shoplayout/cubit/states.dart';
import 'package:messanger_flutter/modules/news_app/Search/SearchScreen.dart';
import 'package:messanger_flutter/modules/shop_app/Login/Login.dart';
import 'package:messanger_flutter/modules/shop_app/search/Search.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shop_cubit , Shopappstates >(
      listener: (context , state)=>{},
      builder: (context , state)
      {
        var cubit = shop_cubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            title:Text('Salla') ,
            actions: [
              IconButton(onPressed: (){
                Navigateto(context,Search_screen()) ;
              }, icon: Icon(Icons.search))
            ],
          ),
          body: cubit.shop_screens[cubit.current_index],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index)
            {
              cubit.changebutton(index) ;
            },
            currentIndex: cubit.current_index ,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home) , label: 'Home' ),
              BottomNavigationBarItem(icon: Icon(Icons.apps) , label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite) ,label: 'Favourites' ),
              BottomNavigationBarItem(icon: Icon(Icons.settings) ,label: 'Setting' )
            ],
          ),
        ) ;
      },
    );
  }
}
