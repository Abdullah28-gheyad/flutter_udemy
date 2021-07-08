
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/components/constants.dart';
import 'package:messanger_flutter/layout/social/cubit/cubit.dart';
import 'package:messanger_flutter/models/social_app/SocialModel.dart';
import 'package:messanger_flutter/modules/social_app/social_login_screen/cubit/states.dart';

class social_app_login_cubit extends Cubit <SocialLoginStates> {
  final context ;
  social_app_login_cubit(this.context):super(SocialLoginInitialState()) ;
  static social_app_login_cubit get (context)=>BlocProvider.of(context) ;
  Social_model social_model ;
  void User_login (
  {@required String email , @required String password})
  {
    emit(SocialLoginLoadingState());
    FirebaseAuth.
    instance.
    signInWithEmailAndPassword(
        email: email,
        password: password)
        .then((value){

      uID = value.user.uid ;

      FirebaseFirestore.instance
          .collection("users")
          .doc(uID).get()
          .then((value) {
        print (value.data()) ;
        social_model = Social_model.fromJson(value.data()) ;
      });

      emit(SocialLoginSuccessState(value.user.uid));
    })
        .catchError((onError){


      emit(SocialLoginErrorState(onError.toString()));

    }) ;
  }
}