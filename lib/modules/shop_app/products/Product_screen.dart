
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:messanger_flutter/layout/shoplayout/cubit/cubit.dart';
import 'package:messanger_flutter/layout/shoplayout/cubit/states.dart';
import 'package:messanger_flutter/models/Shopapp/Category/category.dart';
import 'package:messanger_flutter/models/Shopapp/Homemodel/Home_model.dart';


class Product_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shop_cubit,Shopappstates>(
      listener: (context , state)=>{
        if (state is shop_succcess_favourite_data_state)
          {
            if(state.model.status=false)
              {
                Fluttertoast.showToast(
                    msg: state.model.message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                )
              }
          }
      },
      builder: (context , state){
        return ConditionalBuilder(
            condition: shop_cubit.get(context).home_model !=null&&shop_cubit.get(context).category_model !=null,
            builder: (context)=>builder_widget(shop_cubit.get(context).home_model ,shop_cubit.get(context).category_model , context ),
          fallback: (context)=> Center(child: CircularProgressIndicator()) ,
        );
      }
    );}

  Widget builder_widget (HomeModel model,Categories_model categories_model , context)
  {
   return SingleChildScrollView(
     physics: BouncingScrollPhysics(),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: model.data.banners.map((e) => Image(
                image: NetworkImage('${e.image}'),
            width: double.infinity,
            fit: BoxFit.cover,
            ),).toList(),
            options: CarouselOptions(
                height: 250,
                initialPage: 0,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                reverse: false,autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal
            ),) ,
          SizedBox(
            height: 10.0,
          ) ,

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Gategories' , style: TextStyle(fontSize: 24 , fontWeight: FontWeight.w800),),
                Container(
                  height: 100,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index)=>build_gategory_item(categories_model.data.data_model[index]),
                      separatorBuilder: (cotext,index)=>SizedBox(width: 10.0,),
                      itemCount: categories_model.data.data_model.length),
                ),
                SizedBox(height: 20.0,),
                Text('New Products' , style: TextStyle(fontSize: 24 , fontWeight: FontWeight.w800),),
              ],
            ),
          ) ,
          Container(
            color: Colors.grey[300],
            child: GridView.count(
              shrinkWrap: true,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 1/1.75,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(model.data.products.length, (index) => build_Grid_product(model.data.products[index],context)),
            ),
          ),
        ],

      ),
   );
  }

  Widget build_Grid_product (ProductModel productModel , context)
  {
    return Container(

      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                  image: NetworkImage(productModel.image),
                width: double.infinity,
                height: 200,
              ),
              if (productModel.discount!=0)
                   Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                color: Colors.red,
                child: Text(
                  'DISCOUNT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0
                  ),
                ),

              )
            ],
          ) ,
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${productModel.name}',
                   maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    height: 1.3
                  ),
                ) ,
                Row(
                  children: [
                    Text(
                      '${productModel.price.round()} \$',
                      style: TextStyle(color: Colors.blue, fontSize: 12),
                    ),
                    SizedBox(width: 5,),
                    if (productModel.discount!=0)  Text(
                      '${productModel.oldPrice.round()}\$',
                      style: TextStyle(
                          color: Colors.grey ,
                          fontSize: 10.0,
                          decoration: TextDecoration.lineThrough
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: shop_cubit.get(context).favourites[productModel.id]?Colors.blue:Colors.grey,
                      radius: 15.0,
                        child: IconButton(
                            onPressed: (){
                              shop_cubit.get(context).change_favorites(productModel.id);

                            },
                            iconSize: 14,
                            color: Colors.white,
                            icon: Icon(Icons.favorite_border)
                        )
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget build_gategory_item(Data_model data)=> Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Image(
        image: NetworkImage(data.image),
        height: 100.0,
        fit: BoxFit.cover,
        width: 100.0,
      ) ,
      Container(
        width: 100,
        color: Colors.black.withOpacity(0.8),
        child: Text(
          '${data.name}' ,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      )
    ],
  ) ;
}
