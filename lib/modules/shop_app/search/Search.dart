import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_flutter/Shared/components/components.dart';
import 'package:messanger_flutter/layout/shoplayout/cubit/cubit.dart';
import 'package:messanger_flutter/modules/shop_app/search/cubit/cubit.dart';
import 'package:messanger_flutter/modules/shop_app/search/cubit/states.dart';

class Search_screen extends StatelessWidget {
  var Text_search = TextEditingController() ;
  var form_key = GlobalKey<FormState>() ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>Search_cubit(),
      child: BlocConsumer<Search_cubit , Search_states>(
        listener: (context , state){},
        builder: (context , state){
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: form_key,
                child: Column(
                  children: [
                    default_Edit_text(
                        Validate: (String text){
                          if (text.isEmpty)
                            return 'Please Enter the text ' ;
                          return null ;
                        },
                        controller: Text_search,
                        type: TextInputType.text ,
                      prefix: Icons.search_rounded ,
                      hint: 'Search',
                      onsubmit: (String text){
                          if (form_key.currentState.validate())
                            {
                              var model = Search_cubit.get(context).Search(text) ;
                            }
                      }
                    ),
                    SizedBox(height: 20,) ,
                    if (state is search_loading_state)
                      LinearProgressIndicator() ,
                    SizedBox(height: 20,) ,
                    if (state is search_success_state)
                    Expanded(
                      child: ListView.separated(
                          physics:BouncingScrollPhysics(),
                          itemBuilder: (context, index) => build_list_product(Search_cubit.get(context).search_model.data.data[index],context , is_old_price: false),
                          separatorBuilder: (context, index) =>Container(height: 1, color: Colors.grey,),
                          itemCount: Search_cubit.get(context).search_model.data.data.length
                      ),
                    )

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}
