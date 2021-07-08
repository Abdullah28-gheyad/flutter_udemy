import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/States.dart';
import 'cubit/cubit.dart';


class counter_screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) => counter_cubit(),
      child: BlocConsumer<counter_cubit, counter_states>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Counter'),
              ),
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () {
                      counter_cubit.get(context).minus();
                    },
                        child: Text('Minus')),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('${counter_cubit
                          .get(context)
                          .counter}', style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),),
                    ),
                    TextButton(onPressed: () {
                      counter_cubit.get(context)
                        ..plus();
                    }, child: Text('Plus')),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}


