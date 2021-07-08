import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MessangerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,

          title: Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80')
                      ,radius: 25,
                ),
                Text(
                  'Chats'
                )
              ],
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.only(left: 5.0),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.blue,
                child: IconButton(
                  icon: Icon(Icons.camera_alt),
                  color: Colors.white,
                  iconSize: 15,
                  onPressed: (){},
                ),
              ),
            ),
            SizedBox(width: 5.0,),
            Container(
              padding: EdgeInsets.only(right: 5.0),
              child: CircleAvatar(radius: 15,
                backgroundColor: Colors.blue,
                child: IconButton(
                  icon: Icon(Icons.edit),
                  iconSize: 15,
                  onPressed: (){},
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      //Body
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.grey[300],
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                    'Search' ,style: TextStyle(fontSize: 20.0),
                    )
                  ],
                ),
              ),
             SizedBox(height: 5.0,),
             Container(
               height: 90.0,
               child: ListView.builder(
                 shrinkWrap: true,
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (context,index){
                      return build_statue();
                 },
                 itemCount: 10,
               ),
             ),
              SizedBox(height: 10.0,),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context , index)
                {
                    return build_chat();
                },
                separatorBuilder: (context , index){return SizedBox(height: 20.0);},
                itemCount: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
Widget build_chat () {
  return Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://www.whatsappimages.in/wp-content/uploads/2020/11/Boys-Free-Feeling-Sad-Pics-Images-Download-300x205.jpg'),
            radius: 30,
          ),
          CircleAvatar(
            backgroundColor:Colors.white,
            radius: 8,
          ),
          CircleAvatar(
            backgroundColor:Colors.green,
            radius: 7,
          ),
        ],
      ),
      SizedBox(width: 3.0,),
      Container(
        child: Column(
          children: [
            Text(
              'Abdullah Mahmoud Ghayad',
              style: TextStyle(fontSize: 15.0 , ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10.0,),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    'hello My name is....    ',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: 5.0,),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 4,
                      )
                      ,SizedBox(width: 1,),
                      Text(
                          '02.00 pm'
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}
  Widget build_statue () {
    return Container(
      padding: EdgeInsetsDirectional.only(top: 20),
      child: SingleChildScrollView(
        scrollDirection:Axis.horizontal ,
        child: Row(
          children: [

            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://www.whatsappimages.in/wp-content/uploads/2020/11/Boys-Free-Feeling-Sad-Pics-Images-Download-300x205.jpg'),
                  radius: 30,
                ),
                CircleAvatar(
                  backgroundColor:Colors.white,
                  radius: 8,
                ),
                CircleAvatar(
                  backgroundColor:Colors.green,
                  radius: 7,
                ),
              ],
            ),
            SizedBox(width: 5.0,),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://www.whatsappimages.in/wp-content/uploads/2020/11/Boys-Free-Feeling-Sad-Pics-Images-Download-300x205.jpg'),
                  radius: 30,
                ),
                CircleAvatar(
                  backgroundColor:Colors.white,
                  radius: 8,
                ),
                CircleAvatar(
                  backgroundColor:Colors.green,
                  radius: 7,
                ),
              ],
            ),
            SizedBox(width: 5.0,),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://www.whatsappimages.in/wp-content/uploads/2020/11/Boys-Free-Feeling-Sad-Pics-Images-Download-300x205.jpg'),
                  radius: 30,
                ),
                CircleAvatar(
                  backgroundColor:Colors.white,
                  radius: 8,
                ),
                CircleAvatar(
                  backgroundColor:Colors.green,
                  radius: 7,
                ),
              ],
            ),
            SizedBox(width: 5.0,),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://www.whatsappimages.in/wp-content/uploads/2020/11/Boys-Free-Feeling-Sad-Pics-Images-Download-300x205.jpg'),
                  radius: 30,
                ),
                CircleAvatar(
                  backgroundColor:Colors.white,
                  radius: 8,
                ),
                CircleAvatar(
                  backgroundColor:Colors.green,
                  radius: 7,
                ),
              ],
            ),
            SizedBox(width: 5.0,),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://www.whatsappimages.in/wp-content/uploads/2020/11/Boys-Free-Feeling-Sad-Pics-Images-Download-300x205.jpg'),
                  radius: 30,
                ),
                CircleAvatar(
                  backgroundColor:Colors.white,
                  radius: 8,
                ),
                CircleAvatar(
                  backgroundColor:Colors.green,
                  radius: 7,
                ),
              ],
            ),
            SizedBox(width: 5.0,),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://www.whatsappimages.in/wp-content/uploads/2020/11/Boys-Free-Feeling-Sad-Pics-Images-Download-300x205.jpg'),
                  radius: 30,
                ),
                CircleAvatar(
                  backgroundColor:Colors.white,
                  radius: 8,
                ),
                CircleAvatar(
                  backgroundColor:Colors.green,
                  radius: 7,
                ),
              ],
            ),
            SizedBox(width: 5.0,),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://www.whatsappimages.in/wp-content/uploads/2020/11/Boys-Free-Feeling-Sad-Pics-Images-Download-300x205.jpg'),
                  radius: 30,
                ),
                CircleAvatar(
                  backgroundColor:Colors.white,
                  radius: 8,
                ),
                CircleAvatar(
                  backgroundColor:Colors.green,
                  radius: 7,
                ),
              ],
            ),
            SizedBox(width: 5.0,),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://www.whatsappimages.in/wp-content/uploads/2020/11/Boys-Free-Feeling-Sad-Pics-Images-Download-300x205.jpg'),
                  radius: 30,
                ),
                CircleAvatar(
                  backgroundColor:Colors.white,
                  radius: 8,
                ),
                CircleAvatar(
                  backgroundColor:Colors.green,
                  radius: 7,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}