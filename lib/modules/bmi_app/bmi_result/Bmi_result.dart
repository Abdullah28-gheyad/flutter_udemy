import 'package:flutter/material.dart';

class Bmi_result extends StatelessWidget {
  String gender  , Result , Age;

  Bmi_result(this.gender, this.Result, this.Age);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        'Bmi Result'
      ),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gender : $gender' , style: TextStyle(fontSize: 30.0 , fontWeight: FontWeight.bold),),
            Text('Result : $Result ' , style: TextStyle(fontSize: 30.0 , fontWeight: FontWeight.bold),),
            Text('Age : $Age' , style: TextStyle(fontSize: 30.0 , fontWeight: FontWeight.bold),)

          ],
        ),
      ),
    );
  }
}
