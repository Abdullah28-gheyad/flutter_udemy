import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/components/components.dart';
import 'package:messanger_flutter/layout/newsapp/cubit/cubit.dart';
import 'package:messanger_flutter/layout/newsapp/cubit/states.dart';

class SearchScreen extends StatelessWidget {

  TextEditingController textEditingController = new TextEditingController() ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context , state)=>{},
      builder: (context , state) {
        var article = NewsCubit.get(context).Search ;
       return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: default_Edit_text(
                Validate: (String value){
                  if (value.isEmpty)
                    return 'Search must not be empty' ;
                  return null;
                },
                onchanged: (value){
                        NewsCubit.get(context).get_search(value) ;
                },
                controller: textEditingController,
                type: TextInputType.text ,
                hint: 'Search',
                prefix: Icons.search ,
              ),
            ) ,
            Expanded(child: ListView.separated(physics: BouncingScrollPhysics(),itemBuilder: (context,index)=>build_article_item(article[index],context), separatorBuilder: (context , index)
            {
              return Container(
                height: 1,
                color: Colors.grey,
              );
            }, itemCount: article.length),)
          ],
        ),
      );
  }
    );
  }
}

