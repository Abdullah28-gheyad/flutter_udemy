import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messanger_flutter/Shared/components/components.dart';

class Login extends StatefulWidget
{
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool password_show  = false ;

  var email = TextEditingController();

  var password = TextEditingController();

  var formkey = GlobalKey<FormState>() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0 ,
            vertical: 10.0
          ),
          child: Form(
            key:formkey ,
            child: Column(
              children: [
                Text(
                  'Login' ,style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
             default_Edit_text(Validate: (String value){
               if (value.isEmpty)
                 return 'Email must not be empty' ;
               return null ;
             }, hint: 'Email',prefix: Icons.email,controller: email, type: TextInputType.emailAddress),
                SizedBox(
                  height: 10.0,
                ),
              default_Edit_text(Validate: (String passord){
                if (passord.isEmpty)
                  return 'Password must not be empty' ;
                return null ;
              }, controller: password, type: TextInputType.visiblePassword , suffixpress: (){
               setState(() {
                 password_show=!password_show ;

               });

              },obsecure: !password_show ,
              suffix: Icons.remove_red_eye , prefix: Icons.lock , hint: 'Password'),
                SizedBox(
                  height: 10.0,
                ),
                default_button(text: 'Login' , function: (){
                 if (formkey.currentState.validate())
                   {
                     print(email.text) ;
                     print(password.text);
                   }

                }) ,
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Text(
                        'Dont have account !!'
                    ) ,
                    TextButton(onPressed: (){}, child: Text('Create Now'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}