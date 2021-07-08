import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:messanger_flutter/Shared/components/components.dart';
import 'package:messanger_flutter/Shared/network/local/cash_helper.dart';
import 'package:messanger_flutter/layout/social/social_layout.dart';
import 'package:messanger_flutter/modules/social_app/social_login_screen/cubit/cubit.dart';
import 'package:messanger_flutter/modules/social_app/social_login_screen/cubit/states.dart';
import 'package:messanger_flutter/modules/social_app/social_register/register_screen.dart';

class social_login_screen extends StatelessWidget {
  var formkey = GlobalKey<FormState>() ;
  TextEditingController Email_controller = TextEditingController() ;
  TextEditingController Password_controller = TextEditingController() ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>social_app_login_cubit(context),
      child: BlocConsumer<social_app_login_cubit,SocialLoginStates>(
        listener: (context,state)=>{
          if (state is SocialLoginErrorState)
            {
                Fluttertoast.showToast(
                msg: state.error.toString(),
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
                  )
            }
         else if (state is SocialLoginSuccessState)
            {

          CachHelper.saveData(key: 'u_id', value: state.u_id)
              .then((value){

                Navigatetoandremove(context, SocialLayout());
          })

            }
        },
        builder: (context,state)=>Scaffold(
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
                        'LOGIN' , style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.black , fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'login now to communicate with friends' , style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.grey
                      ),
                      ) ,
                      SizedBox(height: 30.0,),
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
                        onsubmit: (value){
                          if (formkey.currentState.validate())
                          {
                            social_app_login_cubit.
                            get(context).
                            User_login(email: Email_controller.text
                            , password: Password_controller.text);
                          }

                        } ,

                      ) ,
                      SizedBox(height: 20.0,) ,
                      Center(
                        child: ConditionalBuilder(
                          condition: state is! SocialLoginLoadingState,
                          fallback:(context)=> CircularProgressIndicator(),
                          builder: (context)=>default_button(
                              function: (){
                                if (formkey.currentState.validate())
                                {
                                  social_app_login_cubit
                                      .get(context)
                                      .User_login(email: Email_controller.text,
                                      password: Password_controller.text);
                                }

                              },
                              text: 'LOGIN'),
                        ),
                      ),
                      SizedBox(height: 20.0,) ,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't Have an account? ") ,
                          TextButton(onPressed: (){
                            Navigateto(context, Social_Register_screen()) ;
                          }, child: Text('REGISTER NOW !'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ) ;
  }
}
