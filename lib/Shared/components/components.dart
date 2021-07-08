import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messanger_flutter/Shared/Styles/icon_broken.dart';
import 'package:messanger_flutter/layout/shoplayout/cubit/cubit.dart';
import 'package:messanger_flutter/modules/news_app/webview/webviewscreen.dart';

Widget default_appbar(
{
  @required BuildContext context,
  String title ,
  List <Widget> actions ,
}
)=> AppBar(
  title: Text(title) ,
  actions: actions,
  leading: IconButton(
    onPressed: (){
      Navigator.pop(context) ;
    },
    icon: Icon(
      IconBroken.Arrow___Left_2
    ),
  ),

);
Widget default_button (
{

  double width = double.infinity ,
  double hight = 40 ,
  Color background = Colors.blue,
  @required Function function,
  @required String text ,
}
    )=>Container(
  width: width,
  height: hight,
  color: background,
  child: MaterialButton(
    onPressed: function,
    child: Text(text.toUpperCase() , style: TextStyle(color: Colors.white),),
  ),
) ;

Widget default_Edit_text (
{
  bool is_clickable = true,
  String hint ,
  IconData suffix ,
  IconData prefix ,
  Function onsubmit ,
  Function ontab ,
  Function onchanged ,
  bool obsecure = false  ,
  @required Function Validate,
  @required TextEditingController controller,
  @required TextInputType type ,
  Function suffixpress ,
}
)=>TextFormField(
  enabled: is_clickable,
  onTap: ontab,
  obscureText: obsecure,
  controller: controller,
  keyboardType:  type,
  onFieldSubmitted: onsubmit,
  onChanged: onchanged,
    validator: Validate ,
  decoration: InputDecoration(
      labelText: hint ,
      border: OutlineInputBorder(),
      prefixIcon: IconButton(icon:Icon(prefix) ,
      onPressed: suffixpress,) ,
     suffixIcon: Icon(suffix) ,
  ),
);

Widget build_task_item()=> InkWell(
  child:   Padding(
  
    padding: const EdgeInsets.all(20.0),
  
    child: Row(
  
      children: [
  
        CircleAvatar(
  
          radius: 40.0,
  
          child: Text(
  
              '02:00 pm'
  
          ),
  
        ),
  
        SizedBox( width: 10.0,) ,
  
        Column(
  
          mainAxisSize: MainAxisSize.min,
  
          children: [
  
            Text(
  
              'Task Title' , style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold),
  
            ) ,
  
            Text(
  
              '20 april , 2021' ,
  
              style: TextStyle(color: Colors.grey),
  
            )
  
          ],
  
        )
  
      ],
  
    ),
  
  ),
);

Widget build_article_item(article, context)=>InkWell(
  onTap: (){Navigateto(context, WebviewScreen(article['url'])) ; },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Expanded(
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10) ,
                image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']}')
                    ,fit: BoxFit.cover
                )

            ),
          ),
        ),
        SizedBox(width: 20,) ,
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ) ,
                Text(
                  '${article['publishedAt']}' ,
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        )
      ],
    ),
  ),
);


void Navigateto(context , widget){
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>widget,),);
  }
void Navigatetoandremove(context , widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget,),
        (Route<dynamic> route) => false,
  );
}
  Widget build_list_product ( data,context,{bool is_old_price = true})
  {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(data.image),
                  width: 120,
                  height: 120,
                ),
                if (data.discount!=0&& is_old_price)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    color: Colors.red,
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0
                      ),
                    ),

                  )
              ],
            ) ,
            SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        height: 1.3
                    ),
                  ) ,
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        data.price.toString(),
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                      ),
                      SizedBox(width: 5,),
                      if (data.discount!=0&& is_old_price)  Text(
                        data.oldPrice.toString(),
                        style: TextStyle(
                            color: Colors.grey ,
                            fontSize: 10.0,
                            decoration: TextDecoration.lineThrough
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                          backgroundColor: shop_cubit.get(context).favourites[data.id]?Colors.blue:Colors.grey,
                          radius: 15.0,
                          child: IconButton(
                              onPressed: (){
                                shop_cubit.get(context).change_favorites(data.id);
                              },
                              iconSize: 14,
                              color: Colors.white,
                              icon: Icon(Icons.favorite_border)
                          )
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


