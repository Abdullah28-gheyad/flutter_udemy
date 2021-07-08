import 'package:flutter/cupertino.dart';

class MessageModel
{


  String Text;
  String Sender_id;
  String Reciever_id;
  String date_time;


  MessageModel({ this.date_time , this.Text , this.Sender_id , this.Reciever_id,}) ;
  MessageModel.fromJson(Map <String , dynamic> json)
  {
    Text = json['Text'] ;
    Sender_id = json['Sender_id'] ;
    Reciever_id = json['Reciever_id'] ;
    date_time = json['date_time'] ;
  }

  Map <String , dynamic> to_map ()
  {
    return {
      'Text':Text ,
      'Sender_id':Sender_id ,
      'Reciever_id':Reciever_id ,
      'date_time':date_time,
    };
  }
}