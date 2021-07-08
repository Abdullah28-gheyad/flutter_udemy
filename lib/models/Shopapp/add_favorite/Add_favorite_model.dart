class Change_favourite_model
{
    bool status ;
    String message ;
    Change_favourite_model.fromjson (Map <String ,dynamic> json)
    {
      status = json['status'] ;
      message = json['message'] ;
    }
}