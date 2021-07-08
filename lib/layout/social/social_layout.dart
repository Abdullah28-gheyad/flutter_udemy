
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/Styles/icon_broken.dart';
import 'package:messanger_flutter/Shared/components/components.dart';
import 'package:messanger_flutter/layout/social/cubit/cubit.dart';
import 'package:messanger_flutter/layout/social/cubit/states.dart';
import 'package:messanger_flutter/modules/social_app/newpost/new_post_screen.dart';
class SocialLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit = SocialCubit.get(context) ;
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){
        if (state is SocialNewPostState)
          Navigateto(context, NewPost_Screen()) ;
      },
      builder: (context,state)=>Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){}, icon:Icon(IconBroken.Notification)),
            IconButton(onPressed: (){}, icon:Icon(IconBroken.Search)),
          ],
          title: Text(
            cubit.titles[cubit.currentIndex] ,
          ),
        ),
        body: cubit.screens[cubit.currentIndex]  ,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (index){
            cubit.changeBottomNav(index) ;
          },
          items: [
            BottomNavigationBarItem(icon: Icon(IconBroken.Home)  , label: 'Home'),
            BottomNavigationBarItem(icon: Icon(IconBroken.Chat) , label: 'Chats'),
            BottomNavigationBarItem(icon: Icon(IconBroken.Upload) , label: 'post'),
            BottomNavigationBarItem(icon: Icon(IconBroken.User) , label: 'Users'),
            BottomNavigationBarItem(icon: Icon(IconBroken.Setting) , label: 'Settings'),
          ],
        ),
      ),
    );
  }
}
