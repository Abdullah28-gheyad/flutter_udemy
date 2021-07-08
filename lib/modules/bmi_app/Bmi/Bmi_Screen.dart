
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messanger_flutter/modules/bmi_app/bmi_result/Bmi_result.dart';

class BmiScrnn extends StatefulWidget {
  @override
  _BmiScrnnState createState() => _BmiScrnnState();
}

class _BmiScrnnState extends State<BmiScrnn> {
  bool ismale = true ;
  double hight  = 120.0 ;
  int age = 20 ;
  int wight = 40 ;
  String gender ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Bmi Calculater')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          gender = 'male' ;
                          ismale=true;
                        });

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: ismale ? Colors.blue:Colors.grey[400]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('assets/Images/male.png' ),width: 80.0 , height: 80.0,),
                            SizedBox(height:10.0 ,),
                            Text('Male' , style: TextStyle(fontSize: 30.0 , fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          gender = 'female';
                          ismale=false ;
                        });

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: !ismale? Colors.blue: Colors.grey[400]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('assets/Images/female.png'),height: 80.0,width: 80.0,),
                            SizedBox(height:10.0 ,),
                            Text('Female' , style: TextStyle(fontSize: 30.0 , fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10) ,
                color: Colors.grey[400]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',style: TextStyle(fontSize: 30.0 , fontWeight: FontWeight.bold),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${hight.round()}' , style: TextStyle(fontSize: 40.0 , fontWeight: FontWeight.bold),),
                       SizedBox(width: 10.0,),
                        Text('CM' , style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Slider(
                      value: hight,
                      max: 220.0,
                      min: 90.0,
                      onChanged: (value){
                        setState(() {
                          hight=value;
                        });
                      },
                    )
                  ],
                ),
              ),
            )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[400]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Age' , style: TextStyle(fontSize: 30.0 , fontWeight: FontWeight.bold),)
                         , Text('$age' , style: TextStyle(fontSize: 40.0 , fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'age-',
                              mini: true,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              }
                              ,child: Icon(Icons.remove),
                            ),
                            FloatingActionButton(
                              heroTag: 'age+',
                              mini: true,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              }
                              ,child: Icon(Icons.add),
                            )
                          ],
                        )

                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[400]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('weight' , style: TextStyle(fontSize: 30.0 , fontWeight: FontWeight.bold),)
                          , Text('$wight' , style: TextStyle(fontSize: 40.0 , fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'weigh-',
                              mini: true,
                              onPressed: (){
                                setState(() {
                                  wight-- ;
                                });
                              }
                              ,child: Icon(Icons.remove),
                            ),
                            FloatingActionButton(
                              mini: true,
                              heroTag: 'weight+',
                              onPressed: (){
                                setState(() {
                                  wight++;
                                });
                              }
                              ,child: Icon(Icons.add),
                            )

                          ],
                        )


                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            height: 50.0,
            child: MaterialButton(
              onPressed: (){
               var result = wight/pow(hight/100, 2) ;
                print(result.round());
                Navigator.push(
                    context,
                MaterialPageRoute(builder: (context)=>Bmi_result(gender , result.round().toString() , age.toString())));
                           },
              child: Text("Calculate",style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}
