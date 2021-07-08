import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/components/components.dart';
import 'package:messanger_flutter/layout/shoplayout/cubit/cubit.dart';
import 'package:messanger_flutter/layout/shoplayout/cubit/states.dart';
import 'package:messanger_flutter/models/Shopapp/Favorites_model/favourites_model.dart';

class Favourit_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shop_cubit, Shopappstates>(
        listener: (context, state) => {},
        builder: (context, state) {
          return
            ConditionalBuilder(
              condition: shop_cubit
                  .get(context)
                  .favorites_model != null,
              builder: (context) =>
                  ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          build_list_product(shop_cubit
                              .get(context)
                              .favorites_model
                              .data
                              .data[index].product, context),
                      separatorBuilder: (context, index) =>
                          Container(height: 1, color: Colors.grey,),
                      itemCount: shop_cubit
                          .get(context)
                          .favorites_model
                          .data
                          .data
                          .length
                  ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            );
        }
    );
  }
}
