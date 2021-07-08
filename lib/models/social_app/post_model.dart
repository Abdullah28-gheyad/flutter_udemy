import 'package:flutter/cupertino.dart';

class Post_model
{
  String name;
  String u_id;
  String image;
  String date_time ;
  String text ;
  String post_image ;

  Post_model(
      { this.name ,
        this.u_id,
        this.image,
        this.date_time,
        this.text,
        this.post_image,
   }) ;
  Post_model.fromJson(Map <String , dynamic> json)
  {
    name = json['name'] ;
    u_id = json['u_id'] ;
    image = json['image'] ;
    date_time = json['date_time'] ;
    text = json['text'] ;
    post_image = json['post_image'] ;
  }

  Map <String , dynamic> to_map ()
  {
    return {
      'name':name ,
      'u_id':u_id,
      'image':image,
      'date_time':date_time,
      'text':text,
      'post_image':post_image,
    };
  }
}