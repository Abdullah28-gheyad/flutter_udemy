import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:messanger_flutter/Shared/components/components.dart';
import 'package:messanger_flutter/Shared/components/constants.dart';
import 'package:messanger_flutter/Shared/network/local/cash_helper.dart';
import 'package:messanger_flutter/layout/shoplayout/Shop_layout.dart';
import 'package:messanger_flutter/layout/shoplayout/cubit/states.dart';
import 'package:messanger_flutter/modules/shop_app/register/cubit/cubit.dart';
import 'package:messanger_flutter/modules/shop_app/register/cubit/states.dart';

class Register_screen extends StatelessWidget {
  var formkey = GlobalKey<FormState>() ;
  TextEditingController Email_controller = TextEditingController() ;
  TextEditingController Password_controller = TextEditingController() ;
  TextEditingController name_controller = TextEditingController() ;
  TextEditingController phone_controller = TextEditingController() ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>shop_app_Register_cubit(),
      child: BlocConsumer<shop_app_Register_cubit , ShopRegisterStates>(
        listener:(context , states) {
          if (states is ShopRegisterSuccessState)
          {
            if (states.Risgister_model.status==true)
            {
              print (states.Risgister_model.data.token) ;
              print (states.Risgister_model.message) ;
              Fluttertoast.showToast(
                  msg: states.Risgister_model.message,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
              CachHelper.saveData(key: 'token', value: states.Risgister_model.data.token).then((value)
              {
                token = states.Risgister_model.data.token ;
                Navigatetoandremove(context,ShopLayout(),) ;
              });
            }
            else
            {
              print (states.Risgister_model.message) ;
              Fluttertoast.showToast(
                  msg: states.Risgister_model.message,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
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
                        'register now to browse our hot offers' , style: Theme.of(context).textTheme.bodyText1.copyWith(
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
                          condition:states is! ShopRegisterLoadingState,
                          fallback:(context)=> CircularProgressIndicator(),
                          builder: (context)=>default_button(
                              function: (){
                                if (formkey.currentState.validate())
                                {
                                   shop_app_Register_cubit.get(context).User_Register(
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
