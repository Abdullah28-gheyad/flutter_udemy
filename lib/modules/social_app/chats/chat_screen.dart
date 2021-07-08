import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/components/components.dart';
import 'package:messanger_flutter/layout/social/cubit/cubit.dart';
import 'package:messanger_flutter/layout/social/cubit/states.dart';
import 'package:messanger_flutter/models/social_app/SocialModel.dart';
import 'package:messanger_flutter/modules/social_app/chatscreendetails/chatdetails_screen.dart';

class Chat_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit , SocialStates>(
     builder: (context , state)=>ConditionalBuilder(
       condition: SocialCubit.get(context).AllUsers.length>0,
       builder: (BuildContext context)=> ListView.separated(
           physics: BouncingScrollPhysics(),
           itemBuilder: (context , index)=>Build_Chat_Users(context,SocialCubit.get(context).AllUsers[index]),
           separatorBuilder: (context , index)=> Container(height: 1, color: Colors.grey,),
           itemCount: SocialCubit.get(context).AllUsers.length
       ),
       fallback: (context)=>Center(child: CircularProgressIndicator()),
     ),
     listener: (context , state){} ,
    ) ;
  }

  Widget Build_Chat_Users (context,Social_model social_model)
  {
    return InkWell(
      onTap: (){
        Navigateto(context, Chat_Details_Screen(social_model)) ;
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
              '${social_model.image}'
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              '${social_model.name}',
              style: TextStyle(
                height: 1.4,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
