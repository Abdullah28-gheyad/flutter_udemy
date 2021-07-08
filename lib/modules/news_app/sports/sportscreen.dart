import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/components/components.dart';
import 'package:messanger_flutter/layout/newsapp/cubit/cubit.dart';
import 'package:messanger_flutter/layout/newsapp/cubit/states.dart';

class SportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).sports;
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context , state){} ,
        builder: (context,state){return ConditionalBuilder(
          condition:list.length>0,
          builder: (context)=> ListView.separated(physics: BouncingScrollPhysics(),itemBuilder: (context,index)=>build_article_item(list[index],context), separatorBuilder: (context , index)
          {
            return Container(
              height: 1,
              color: Colors.grey,
            );
          }, itemCount: list.length),
          fallback: (context)=>Center(child: CircularProgressIndicator()),);}
    ) ;
  }
}
