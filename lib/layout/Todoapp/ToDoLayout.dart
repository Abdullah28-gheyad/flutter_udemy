import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/components/components.dart';
import 'package:messanger_flutter/Shared/components/constants.dart';
import 'package:messanger_flutter/Shared/cubit/cubit.dart';
import 'package:messanger_flutter/Shared/cubit/states.dart';
import 'package:messanger_flutter/Shared/components/constants.dart';

import 'package:sqflite/sqflite.dart';

class home_layout extends StatelessWidget {

  List<Map> tasks =[] ;
  var scaffold_key = GlobalKey<ScaffoldState>() ;
  var form_key = GlobalKey<FormState>() ;
  bool if_shown  = false ;
  IconData fab_icon = Icons.edit ;
  var title_controller = TextEditingController() ;
  var date_controller = TextEditingController() ;
  var time_controller = TextEditingController() ;




  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>Appcubit()..Create_database(),
      child: BlocConsumer<Appcubit,App_states>(
        listener: (context , state)
        {},
        builder: (context , state)
        {
        return  Scaffold(
            key: scaffold_key,
            appBar: AppBar(
              title: Text(Appcubit.get(context).titles[Appcubit.get(context).currentindex]),
            ),
            floatingActionButton: FloatingActionButton(onPressed: () {
              if (if_shown) {

                if (form_key.currentState.validate()) {
                  // insert_to_database(title_controller.text , date_controller.text , time_controller.text , 'new').then((value)
                  // {
                  //   Navigator.pop(context);
                  //   if_shown = false;
                  //   // setState(() {
                  //   //
                  //   // });
                  //   fab_icon = Icons.edit;
                  // });

                }
              }
              else{
                scaffold_key.currentState.showBottomSheet(
                        (context) => Form(
                      key: form_key,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            default_Edit_text(Validate: (String value)
                            {
                              if (value.isEmpty)
                                return 'Title cannot be empty' ;
                              return null ;
                            },
                              controller: title_controller,
                              type: TextInputType.text , hint: 'Title' ,
                              suffix: Icons.title,
                            ) ,
                            SizedBox(
                              height: 5.0,
                            ),
                            default_Edit_text(Validate: (String value)
                            {
                              if (value.isEmpty)
                                return 'Time cannot be empty' ;
                              return null ;
                            },
                                controller: date_controller,
                                type: TextInputType.datetime , hint: 'Time' ,
                                suffix: Icons.watch_later_sharp,
                                ontab: (){
                                  showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
                                    // setState(() {
                                    //
                                    // });
                                    date_controller.text = value.format(context).toString() ;
                                  });
                                }
                            ) ,
                            SizedBox(
                              height: 5.0,
                            ),
                            default_Edit_text(Validate: (String value)
                            {
                              if (value.isEmpty)
                                return 'date cannot be empty' ;
                              return null ;
                            },

                                controller: time_controller,
                                type: TextInputType.datetime , hint: 'date' ,
                                suffix: Icons.date_range_rounded,
                                ontab: (){
                                  showDatePicker(context: context,
                                      initialDate: DateTime.now(), firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2021-05-03')).then((value) => {
                                    time_controller.text = value.toString()
                                  });
                                }
                            ) ,
                          ],
                        ),
                      ),
                    ));
                if_shown = true ;
                // setState(() {
                //
                // });
                fab_icon = Icons.add;
              }

            }, child: Icon(fab_icon),),
            body: ConditionalBuilder(
              condition: true,
              builder: (context)=>Appcubit.get(context).screens[Appcubit.get(context).currentindex],
              fallback: (context)=>Center(child: CircularProgressIndicator(),),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: Appcubit.get(context).currentindex,
              onTap: (index) {
                Appcubit.get(context).change_index(index) ;
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'New Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline), label: 'Done Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined), label: 'Archived Tasks')
              ],
            ),
          );
        },
      ),
    );
  }



}


