import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/components/components.dart';
import 'package:messanger_flutter/layout/social/social_layout.dart';
import 'package:messanger_flutter/modules/social_app/social_register/cubit/cubit.dart';
import 'package:messanger_flutter/modules/social_app/social_register/cubit/states.dart';

class Social_Register_screen extends StatelessWidget {
  var formkey = GlobalKey<FormState>() ;
  TextEditingController Email_controller = TextEditingController() ;
  TextEditingController Password_controller = TextEditingController() ;
  TextEditingController name_controller = TextEditingController() ;
  TextEditingController phone_controller = TextEditingController() ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>social_app_Register_cubit(),
      child: BlocConsumer<social_app_Register_cubit , SocialRegisterStates>(
        listener:(context , states) {
          if (states is SocialCreateusersuccessState)
          {
            Navigatetoandremove(context, SocialLayout()) ;
          }
        },
        builder: (context , states)=>Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'REGISTER' , style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.black , fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'register now to communicate with friends' , style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.grey
                      ),
                      ) ,
                      SizedBox(height: 30.0,),
                      default_Edit_text(
                          Validate: (String value){
                            if (value.isEmpty)
                              return 'Please Enter Your name' ;
                            return null ;
                          },
                          controller: name_controller,
                          type: TextInputType.text ,
                          prefix: Icons.person,
                          hint: 'Name'
                      ),
                      SizedBox(height: 20.0,),
                      default_Edit_text(
                          Validate: (String value){
                            if (value.isEmpty)
                              return 'Please Enter Your Email' ;
                            return null ;
                          },
                          controller: Email_controller,
                          type: TextInputType.emailAddress ,
                          prefix: Icons.email,
                          hint: 'Email'
                      ),
                      SizedBox(height: 15.0,),
                      default_Edit_text(
                        Validate: (String value){
                          if (value.isEmpty)
                            return 'Please Enter Your Password' ;
                          return null ;
                        },
                        controller: Password_controller,
                        type: TextInputType.text ,
                        prefix: Icons.lock,
                        suffix: Icons.remove_red_eye,
                        suffixpress: (){},
                        obsecure: true,
                        hint: 'Password' ,
                      ) ,

                      SizedBox(height: 20.0,),
                      default_Edit_text(
                          Validate: (String value){
                            if (value.isEmpty)
                              return 'Please Enter Your phone' ;
                            return null ;
                          },
                          controller: phone_controller,
                          type: TextInputType.number ,
                          prefix: Icons.phone,
                          hint: 'Phone'
                      ),
                      SizedBox(height: 20.0,) ,
                      Center(
                        child: ConditionalBuilder(
                          condition:states is! SocialRegisterLoadingState,
                          fallback:(context)=> CircularProgressIndicator(),
                          builder: (context)=>default_button(
                              function: (){
                                if (formkey.currentState.validate())
                                {
                                   social_app_Register_cubit.get(context).User_Register(
                                      name:name_controller.text,
                                       email: Email_controller.text,
                                       password: Password_controller.text,
                                         phone: phone_controller.text
                                   );
                                }

                              },
                              text: 'REGISTER'),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
