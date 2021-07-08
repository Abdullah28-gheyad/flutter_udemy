import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messanger_flutter/Shared/components/components.dart';
import 'package:messanger_flutter/Shared/components/constants.dart';
import 'package:messanger_flutter/Shared/cubit/cubit.dart';

class new_tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context,index)=>build_task_item()
        , separatorBuilder: (context,index)=>Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey[300],
    )
        , itemCount: Appcubit.get(context).tasks.length);
  }
}
