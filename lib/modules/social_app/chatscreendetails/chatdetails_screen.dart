import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/Styles/icon_broken.dart';
import 'package:messanger_flutter/layout/social/cubit/cubit.dart';
import 'package:messanger_flutter/layout/social/cubit/states.dart';
import 'package:messanger_flutter/models/social_app/SocialModel.dart';
import 'package:messanger_flutter/models/social_app/message_model.dart';

class Chat_Details_Screen extends StatelessWidget {
  Social_model social_model  ;
  var message_controller = TextEditingController() ;
  Chat_Details_Screen(this.social_model) ;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        SocialCubit.get(context).Get_Messages(Reciever_id: social_model.u_id) ;
        return BlocConsumer<SocialCubit , SocialStates>(
          listener: (context, state){},
          builder: (context, state){

            return Scaffold(
              appBar: AppBar(
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(social_model.image),
                    ) ,
                    SizedBox(width: 15.0,) ,
                    Text(social_model.name) ,
                  ],
                ),
              ),
              body: ConditionalBuilder(
                builder: (context){
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                       Expanded(
                         child: ListView.separated(
                             itemBuilder: (context , index)
                             {
                               MessageModel message = SocialCubit.get(context).Messages[index] ;
                               if (SocialCubit.get(context).userModel.u_id==message.Sender_id)
                                 return build_my_message(message) ;
                               return build_message(message) ;
                             },
                             separatorBuilder: (context,index)=>SizedBox(height: 10.0,),
                             itemCount: SocialCubit.get(context).Messages.length
                         ),
                       ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey[300]
                              ),
                              borderRadius:BorderRadius.circular(15.0)
                          )
                          ,clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  onTap: (){
                                    SocialCubit.get(context)
                                        .Send_message(
                                        Reciever_id: social_model.u_id,
                                        Text: message_controller.text,
                                        date_time: DateTime.now().toString());
                                    message_controller.text='';
                                  },
                                  controller: message_controller,
                                  decoration:InputDecoration(
                                      hintText: 'Enter Your Message Here',
                                      border: InputBorder.none
                                  ),
                                ),
                              ) ,
                              Container(
                                color: Colors.blue,
                                child: IconButton(
                                    onPressed: (){
                                      SocialCubit.get(context)
                                          .Send_message(
                                          Reciever_id: social_model.u_id,
                                          Text: message_controller.text,
                                          date_time: DateTime.now().toString());
                                      message_controller.text='';
                                    },
                                    icon: Icon(IconBroken.Send ,
                                      size: 16,
                                      color: Colors.white,)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                condition: SocialCubit.get(context).Messages.length>0,
                fallback: (context)=>Center(child: CircularProgressIndicator()),
              ),
            );
          },
        );
      },

    );
  }

  Widget build_message (MessageModel model)
  {
    return  Align(
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadiusDirectional.only(
                    bottomEnd:Radius.circular(10.0) ,
                    topStart: Radius.circular(10.0),
                    topEnd:Radius.circular(10.0)
                )
            ),
            padding: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0
            ),
            child: Text(model.Text),
          )
        ],
      ),
    ) ;
  }
  Widget build_my_message (MessageModel model)
  {
    return   Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadiusDirectional.only(
                    bottomStart:Radius.circular(10.0) ,
                    topStart: Radius.circular(10.0),
                    topEnd:Radius.circular(10.0)
                )
            ),
            padding: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0
            ),
            child: Text(model.Text),
          )
        ],
      ),
    ) ;
  }
}
