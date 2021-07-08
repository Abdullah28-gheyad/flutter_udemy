import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/Styles/icon_broken.dart';
import 'package:messanger_flutter/Shared/components/components.dart';
import 'package:messanger_flutter/layout/social/cubit/cubit.dart';
import 'package:messanger_flutter/layout/social/cubit/states.dart';

class NewPost_Screen extends StatelessWidget {
  var post_controller = TextEditingController() ;
  var form_key = GlobalKey<FormState>() ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit , SocialStates>(
      listener: (context , state){},
      builder: (context , state)
      {
        var now = DateTime.now() ;
     return Form(
        key: form_key,
        child: Scaffold(
          appBar:default_appbar(
              context: context,
              title: "Create Post",
              actions: [
                TextButton(onPressed: (){
                    if (SocialCubit.get(context)
                        .postImage == null) {
                      SocialCubit.get(context).createPost(
                          dateTime: now.toString(), text: post_controller.text);
                    }
                    else {
                      SocialCubit.get(context).uploadPostImage(
                          dateTime: now.toString(), text: post_controller.text);
                    }
                    post_controller.text = "" ;
                }, child: Text("POST"))
              ]
          ),

          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (state is SocialCreatePostLoadingState)
                    LinearProgressIndicator(),
                if (state is SocialCreatePostLoadingState)
                  SizedBox(height: 5.0,),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(SocialCubit.get(context).userModel.image),
                    ),
                    SizedBox(width: 10.0,) ,
                    Text(
                        "Abdullah Ghayad"
                    ),
                    SizedBox(width: 5.0,) ,
                  ],
                ) ,
                Expanded(
                  child: TextFormField(
                    controller:post_controller ,
                    decoration: InputDecoration(
                        hintText: "What is in your mind..." ,
                        border: InputBorder.none
                    ),
                  ),
                ) ,
                if (SocialCubit.get(context).postImage!=null)
                  SizedBox(height: 20.0,),
                  if (SocialCubit.get(context).postImage!=null)
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 140.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  image: DecorationImage(
                                    image:FileImage(SocialCubit.get(context).postImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    Icons.close,
                                    size: 16.0,
                                  ),
                                ),
                                onPressed: () {
                                    SocialCubit.get(context).removePostImage() ;
                                },
                              ),
                            ],
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                      ],

                    ),
                if (SocialCubit.get(context).postImage!=null)
                  SizedBox(height: 20.0,),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: (){
                            SocialCubit.get(context).getPostImage();
                          }, child: Row(
                            children: [
                              Icon(IconBroken.Image) ,
                              SizedBox(width: 5.0,),
                              Text("Add Photo")
                            ],
                          ))
                        ],
                      ),
                    ) ,
                    Expanded(child: TextButton(onPressed: (){}, child: Text("# Tags")))
                  ],
                )
              ],
            ),
          ),

        ),
      );
      }
    );
  }
}
