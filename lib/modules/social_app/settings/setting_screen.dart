import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/Styles/icon_broken.dart';
import 'package:messanger_flutter/Shared/components/components.dart';
import 'package:messanger_flutter/layout/social/cubit/cubit.dart';
import 'package:messanger_flutter/layout/social/cubit/states.dart';
import 'package:messanger_flutter/models/social_app/SocialModel.dart';
import 'package:messanger_flutter/modules/social_app/edit_profile/edit_profile_screen.dart';


class Setting_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context , state)=>{},
      builder: (context , state)

        {
          Social_model social_model= SocialCubit.get(context).userModel ;
          return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
          children: [
            Container(
              height: 180,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4) ),
                          image:DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(social_model.cover)
                          )

                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 62,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage:
                      NetworkImage(social_model.image)
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5,) ,
            Text("${social_model.name}" ,
              style: Theme.of(context).textTheme.bodyText1,) ,
            Text("${social_model.bio}" ,
              style: Theme.of(context).textTheme.caption,) ,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){},
                      child: Column(
                        children: [
                          Text("100" ,
                            style: Theme.of(context).textTheme.subtitle1,) ,
                          Text("posts" ,
                            style: Theme.of(context).textTheme.caption,) ,
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){},
                      child: Column(
                        children: [
                          Text("100" ,
                            style: Theme.of(context).textTheme.subtitle1,) ,
                          Text("photos" ,
                            style: Theme.of(context).textTheme.caption,) ,
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){},
                      child: Column(
                        children: [
                          Text("100" ,
                            style: Theme.of(context).textTheme.subtitle1,) ,
                          Text("followers" ,
                            style: Theme.of(context).textTheme.caption,) ,
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){},
                      child: Column(
                        children: [
                          Text("60" ,
                            style: Theme.of(context).textTheme.subtitle1,) ,
                          Text("following" ,
                            style: Theme.of(context).textTheme.caption,) ,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ) ,
            Row(
              children: [
                Expanded(child: OutlinedButton(onPressed: (){}, child: Text("Add Photoes"))),
                SizedBox(width: 10.0,),
                OutlinedButton(onPressed: (){
                  Navigateto(context, EditProfileScreen()) ;
                }, child: Icon(
                  IconBroken.Edit ,
                  size: 16,
                )),

              ],
            )
          ],
        ),
      );}

    );
  }
}
