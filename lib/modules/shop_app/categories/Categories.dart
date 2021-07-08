import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/layout/shoplayout/cubit/cubit.dart';
import 'package:messanger_flutter/layout/shoplayout/cubit/states.dart';
import 'package:messanger_flutter/models/Shopapp/Category/category.dart';

class Category_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shop_cubit , Shopappstates>(
      listener: (context , state)=>{},
      builder: (context , state)=>ListView.separated(
        physics:BouncingScrollPhysics() ,
          itemBuilder: (context,index)=>build_cat_item(shop_cubit.get(context).category_model.data.data_model[index]),
          separatorBuilder: (context,index)=>Container(height: 1,color: Colors.grey,),
          itemCount: shop_cubit.get(context).category_model.data.data_model.length),
    );
  }
  Widget build_cat_item(Data_model model)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(
          image: NetworkImage(model.image)
          ,width: 80,
          height: 80.0,
          fit: BoxFit.cover,
        )
        ,SizedBox(width: 20.0,) ,
        Text(
          model.name ,
          style: TextStyle(fontSize: 20.0 ,
              fontWeight: FontWeight.bold),
        ) ,
        Spacer() ,
        Icon(
            Icons.arrow_forward_ios
        )
      ],
    ),
  );
}
