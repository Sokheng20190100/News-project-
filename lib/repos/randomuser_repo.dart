import 'package:http/http.dart' as http;
import 'package:homework_day3_app/model/randomuser_model.dart';
import 'package:flutter/foundation.dart';

Future<RandomUser> readData() async{
  String url = "https://randomuser.me/api?results=50";
  http.Response response = await http.get(url);

  if(response.statusCode == 200){
    return compute(randomUserFromJson, response.body);
  }
  else
  {
    throw Exception("Error while reading data");
  }
}