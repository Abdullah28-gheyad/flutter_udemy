import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messanger_flutter/models/user_model/user_model.dart';

class user_screen extends StatelessWidget
{
  List<User_Model> users = [
    User_Model('1','abdalla', '01008061806'),
    User_Model('2','mahmoud', '01020714140'),
    User_Model('3','mohamed', '01007408881'),
    User_Model('4','ghayad', '01051854'),
    User_Model('5','mohamed', '541545'),
    User_Model('6','asr', '541545'),
    User_Model('7','abdaasratrlla', '5415454'),
    User_Model('8','sdg', '5454514'),
    User_Model('9','abdasgdsdghlla', '545454'),
    User_Model('10','abdsdgsdgsdgsdgalla', '545451'),


  ] ;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(
         'Users'
       ),
     ),
     body: ListView.separated(
         itemBuilder: (context , index){return build_item(users[index]);},
         separatorBuilder: (context , index){
           return Container(
             width: double.infinity,
             height: 1,
             color: Colors.grey[300],
           );
         },
         itemCount: users.length),
   );
  }

}
Widget build_item (User_Model user_model) {
  String id , name , phone ;
  id = user_model.count ;
  name = user_model.name ;
  phone = user_model.phone ;
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue,
          child: Text(id,style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 20.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(name , maxLines: 1 , overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold),)
              ,
              SizedBox(height: 10.0,),
              Text(
                phone , style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        )
      ],
    ),
  );
}