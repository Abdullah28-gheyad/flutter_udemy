class Categories_model {
  bool status ;
  Categories_data_model data ;
  Categories_model.fromJson(Map <String , dynamic> json)
  {
    status = json['status'] ;
    data = Categories_data_model.fromJson(json['data']) ;
  }
}

class Categories_data_model{
  int current_page ;
  List<Data_model> data_model =[];
  Categories_data_model.fromJson(Map <String , dynamic> json)
  {
    current_page=json[current_page] ;
    json['data'].forEach((element){
      data_model.add(Data_model.fromJson(element)) ;
    });
  }

}

class Data_model
{
  int id ;
  String name ;
  String image ;
  Data_model.fromJson(Map <String , dynamic> json)
  {
    id = json['id'] ;
    name = json['name'] ;
    image = json['image'];
  }
}