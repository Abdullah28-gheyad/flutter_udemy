import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messanger_flutter/Shared/components/components.dart';
import 'package:messanger_flutter/Shared/network/local/cash_helper.dart';
import 'package:messanger_flutter/modules/shop_app/Login/Login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class boarding_model {
  final String Image ;
  final String title ;
  final String body ;
  boarding_model({
    @required this.Image,
    @required this.title,
    @required this.body,
}) ;
}
class on_boarding_screen extends StatefulWidget {

  @override
  _on_boarding_screenState createState() => _on_boarding_screenState();
}

class _on_boarding_screenState extends State<on_boarding_screen> {
  var Controller = PageController() ;

  List<boarding_model> boarding = [
    boarding_model(Image: 'assets/Images/onboarding.png',
        title: 'On Board 1 Title',
        body: 'On Board 1 body'),
    boarding_model(Image: 'assets/Images/hhhhh.jpg',
        title: 'On Board 2 Title',
        body: 'On Board 2 body') ,
    boarding_model(Image: 'assets/Images/haeahe.jpg',
        title: 'On Board 3 Title',
        body: 'On Board 3 body') ,
  ];

  bool is_last = false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            TextButton(onPressed: (){
              submit();
            }, child: Text(
              'SKIP' , style: TextStyle(fontSize: 20 ,  fontWeight:  FontWeight.bold),
            ))
          ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
            onPageChanged:(int index)
                {
                  if (index==boarding.length-1)
                    {
                      setState(() {
                        is_last = true ;
                      });
                    }
                  else
                    {
                      setState(() {
                        is_last = false ;
                      });
                    }
                },
          controller: Controller , physics: BouncingScrollPhysics(), itemBuilder: (context , index)=>built_Boarding_item(boarding[index]),
              itemCount: boarding.length,
              ),
            ) ,
            Row(
              children: [
                SmoothPageIndicator(
                    controller: Controller,
                    count: boarding.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.blue,
                    dotColor: Colors.grey ,
                    spacing: 5 ,
                    dotHeight: 10 ,
                    dotWidth: 10 ,
                    expansionFactor: 4 ,

                  ),
                ),
                Spacer(),
                FloatingActionButton(

                onPressed: (){
                  if (is_last)
                    {
                      setState(() {
                        submit() ;
                      });
                    }
                  Controller.nextPage(
                      duration: Duration(
                        milliseconds: 750
                      ),
                      curve: Curves.fastLinearToSlowEaseIn);
                } , child: Icon(Icons.arrow_forward_ios),)
              ],
            )
          ],
        ),
      ) ,
    );
  }

  Widget built_Boarding_item (boarding_model board)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image(image: AssetImage(board.Image))  ) ,
        SizedBox(height: 20,) ,
        Text(
         board.title ,
          style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold),
        ) ,
        SizedBox(height: 10,) ,
        Text(
          board.body ,
          style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 30,)
      ],
    ) ;
  }
  void submit ()
  {
    CachHelper.saveData(key: 'onBoarding', value: true).then((value)
    {
      if (value)
        Navigatetoandremove(context, ShopLoginScreen()) ;
    }
    ) ;

  }
}
