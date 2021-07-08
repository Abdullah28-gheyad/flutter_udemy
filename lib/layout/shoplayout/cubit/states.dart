import 'package:messanger_flutter/models/Shopapp/Shopapp_login/shoplogin.dart';
import 'package:messanger_flutter/models/Shopapp/add_favorite/Add_favorite_model.dart';

abstract class Shopappstates {}
class shop_initial_state extends Shopappstates {}
class shop_change_button_nav_state extends Shopappstates {}
class shop_loading_home_data_state extends Shopappstates {}
class shop_succcess_home_data_state extends Shopappstates {}
class shop_error_home_data_state extends Shopappstates {}
class shop_succcess_category_data_state extends Shopappstates {}
class shop_error_category_data_state extends Shopappstates {}
class shop_succcess_change_data_state extends Shopappstates {}
class shop_succcess_favourite_data_state extends Shopappstates {
  final Change_favourite_model model ;

  shop_succcess_favourite_data_state(this.model);
}
class shop_error_favourite_data_state extends Shopappstates {}

class shop_loading_getfavorite_data_state extends Shopappstates {}

class shop_error_getfav_data_state extends Shopappstates {}
class shop_succcess_getfav_data_state extends Shopappstates {}



class shop_loading_getProfile_data_state extends Shopappstates {}

class shop_error_getProfile_data_state extends Shopappstates {}
class shop_succcess_getProfile_data_state extends Shopappstates {}




class shop_loading_update_data_state extends Shopappstates {}

class shop_error_update_data_state extends Shopappstates {}
class shop_succcess_update_data_state extends Shopappstates {
  final ShopLoginmodel loginmodel;

  shop_succcess_update_data_state(this.loginmodel);


}