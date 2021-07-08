import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/cubit/states.dart';
import 'package:messanger_flutter/Shared/network/local/cash_helper.dart';
import 'package:messanger_flutter/modules/todo_app/archived_tasks/Archived.dart';
import 'package:messanger_flutter/modules/todo_app/done_tasks/done_task.dart';
import 'package:messanger_flutter/modules/todo_app/new_tasks/new_tasks.dart';

import 'package:sqflite/sqflite.dart';

class Appcubit extends Cubit <App_states>{
  
  Appcubit() : super(Intialstate()) ;
  static Appcubit get(context)=>BlocProvider.of(context) ;
  Database database ;
  List<Map> tasks =[] ;
  String table_name = 'tasks';
  int currentindex = 0;
  List<Widget> screens =
  [new_tasks(),
    done_task(),
    Archived_tasks()
  ];
  List<String> titles = ['New Tasks',
    'Done Tasks',
    'Archived Tasks'];

  void change_index (int index)
  {
    currentindex = index ; 
    emit(App_change_Bottom_navbar_state()) ;
  }
  void Create_database () async
  {
    database = await openDatabase(
        table_name ,
        version: 1,
        onCreate: (database , version) async{
          await  database.execute('create table tasks (id integer primary key , title text , data text , time text , status text )');
          print ('data base created ') ;
        }
        , onOpen:  (database) {
      get_data_from_database(database).then((value)
      {
          tasks=value ;
          print (tasks) ;
          emit(get_database_state()) ;
      });

      print ('data base opened ') ;

    }
    ).then((value) {
      database = value ;
      emit(create_database_state()) ;
    });
  }

  Future insert_to_database(String titel ,String date,String time, String news ) async
  {
    await database.transaction((txn) {
      txn.rawInsert(
          'insert into $table_name (title , data , time , status) values ("$titel","$date","$time","$news") '
      )
          .then((value)  {
        print ('$value insert successfully');
        emit(insert_database_state());
      }).catchError((error){
        print (error.toString()) ;
      });

      return null ;
    });

  }

  Future<List<Map>> get_data_from_database(database)
  async {
    return  await database.rawQuery('select * from tasks');
  }

  bool is_dark = false  ;
  ThemeMode appmode = ThemeMode.dark ;
  void change_app_mode ({bool from_shared})
  {
    if (from_shared!=null) {
      is_dark = from_shared;
      emit(change_app_mode_state());
    }
    else
      {
        is_dark = !is_dark ;
        CachHelper.putData(key: 'isDark', value: is_dark).then((value) => { emit(change_app_mode_state()) }) ;
        emit(change_app_mode_state()) ;
      }

  }
}