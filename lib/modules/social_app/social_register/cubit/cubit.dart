import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/models/social_app/SocialModel.dart';
import 'package:messanger_flutter/modules/social_app/social_register/cubit/states.dart';

class social_app_Register_cubit extends Cubit <SocialRegisterStates> {
  social_app_Register_cubit():super(SocialRegisterInitialState()) ;
  static social_app_Register_cubit get (context)=>BlocProvider.of(context) ;
  void User_Register (
  {
    @required String name ,
  @required String email ,
    @required String password,
    @required String phone
}
      )
  {
    emit(SocialRegisterLoadingState()) ;
    FirebaseAuth.
    instance.createUserWithEmailAndPassword(
        email: email,
        password: password)
        .then((value)  {

          print (value.user.email) ;
          print (value.user.uid) ;
          User_Create(name: name , email: email , phone: phone , U_id: value.user.uid) ;
      })
        .catchError((onError){

      emit(SocialRegisterErrorState(onError.toString())) ;
    });

  }  void User_Create (
  {
    @required String name ,
  @required String email ,
    @required String U_id,
    @required String phone
}
      )
  {
    Social_model social_model = Social_model(
      name: name ,
      email: email ,
      phone: phone ,
      u_id: U_id ,
      is_email_verified: false ,
      image:"https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg",
      cover:"https://www.readersdigest.ca/wp-content/uploads/2017/08/being-a-good-person.jpg",
      bio: "Bio Here..."
    );
      FirebaseFirestore.instance
          .collection('users')
          .doc(U_id)
          .set(social_model.to_map())
          .then((value){

       emit(SocialCreateusersuccessState())  ;
      })
          .catchError((onError){

        emit(SocialCreateusererrorState(onError.toString()))  ;
      });
  }
}