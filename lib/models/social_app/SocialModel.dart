import 'package:flutter/cupertino.dart';

class Social_model
{


  String name;
  String email;
  String phone;
  String u_id;
  String image;
  String cover;
  String bio;
  bool
  is_email_verified;

  Social_model({ this.name , this.email , this.phone , this.u_id,this.is_email_verified,this.image,this.bio,this.cover}) ;
  Social_model.fromJson(Map <String , dynamic> json)
  {
    name = json['name'] ;
    email = json['email'] ;
    phone = json['phone'] ;
    u_id = json['u_id'] ;
    image = json['image'] ;
    is_email_verified= json['is_email_verified'] ;
    bio= json['bio'] ;
    cover= json['cover'] ;
  }

  Map <String , dynamic> to_map ()
  {
    return {
      'name':name ,
      'email':email ,
      'phone':phone ,
      'u_id':u_id,
      'image':image,
      'is_email_verified':is_email_verified ,
      'bio':bio ,
      'cover':cover ,
    };
  }
}