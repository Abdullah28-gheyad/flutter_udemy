class ShopLoginmodel
{
  bool status ;
  String message ;
  User_data data ;
  ShopLoginmodel.FromJson(Map<String , dynamic> json)
  {
    status = json['status'] ;
    message = json['message'] ;
    data = json['data'] !=null ? User_data.FromJson(json['data']):null;
  }
}

class User_data
{
  int id ;
  String name ;
  String email ;
  String phone ;
  String image ;
  int points ;
  int credit ;
  String token ;

  User_data(this.id, this.name, this.email, this.phone, this.image, this.points,
      this.credit, this.token);

  User_data.FromJson(Map<String , dynamic> json)
  {
    id = json['id'] ;
    name = json['name'] ;
    email = json['email'] ;
    phone = json['phone'] ;
    image = json['image'] ;
    points = json['points'] ;
    credit = json['credit'] ;
    token = json['token'] ;


  }
}