import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/components/components.dart';
import 'package:messanger_flutter/Shared/components/constants.dart';
import 'package:messanger_flutter/layout/shoplayout/cubit/cubit.dart';
import 'package:messanger_flutter/layout/shoplayout/cubit/states.dart';
import 'package:messanger_flutter/modules/shop_app/register/cubit/states.dart';

class Setting_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var form_key = GlobalKey<FormState>() ;
    var Name_controller = TextEditingController() ;
    var emeail_controller = TextEditingController() ;
    var phone_controller = TextEditingController() ;

    return BlocConsumer<shop_cubit , Shopappstates>(
      listener: (context , state){},
      builder: (context , state)
        {
          var model = shop_cubit.get(context).user_model ;
          Name_controller.text = model.data.name ;
          emeail_controller.text = model.data.email ;
          phone_controller.text = model.data.phone ;
          return ConditionalBuilder(
           condition: shop_cubit.get(context).user_model!=null,
            builder: (context)=>Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: form_key,
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        if (state is shop_loading_update_data_state)
                        LinearProgressIndicator(),
                        SizedBox(height: 20,),
                        default_Edit_text(
                            Validate: (String value){
                              if (value.isEmpty)
                                return 'Name must no be empty' ;
                              return null ;
                            },
                            controller: Name_controller,
                            type: TextInputType.text ,
                            prefix: Icons.person ,
                            hint: 'Name'
                        ) ,
                        SizedBox(height: 20.0,) ,
                        default_Edit_text(
                            Validate: (String value){
                              if (value.isEmpty)
                                return 'Email must no be empty' ;
                              return null ;
                            },
                            controller: emeail_controller,
                            type: TextInputType.emailAddress ,
                            prefix: Icons.email ,
                            hint: 'Email'
                        ) ,
                        SizedBox(height: 20.0,) ,
                        default_Edit_text(
                            Validate: (String value){
                              if (value.isEmpty)
                                return 'phone must no be empty' ;
                              return null ;
                            },
                            controller: phone_controller,
                            type: TextInputType.number ,
                            prefix: Icons.phone ,
                            hint: 'Phone'
                        ) ,
                        SizedBox(height: 20.0,) ,
                        default_button(function: (){
                          if (form_key.currentState.validate())
                            {
                              shop_cubit.get(context).update_profile(
                                  name: Name_controller.text ,
                                  phone: phone_controller.text ,
                                  email: emeail_controller.text
                              );
                            }

                        }, text: 'update') ,
                        SizedBox(height: 20.0,) ,
                        default_button(function: (){sign_out(context);}, text: 'LOGOUT') ,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            fallback: (context)=>Center(child: CircularProgressIndicator()),
          );}
    );
  }
}
