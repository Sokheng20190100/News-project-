import 'package:homework_day3_app/model/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

const Android = "10.0.2.2";

Future<ArticleModel> readData() async{

  String address = Android;

  String url = "http://$address/api4flutter/read.php";

  http.Response response = await http.get(url);

  if(response.statusCode == 200){
    return compute(articleModelFromJson, response.body);
  }
  else
  {
    throw Exception("Error while reading data");
  }
}
Future<String> insertData(Article article) async{

  String address = Android;

  String url = "http://$address/api4flutter/insert.php";
  http.Response response = await http.post(url, body: article.toJson());

  if(response.statusCode == 200){
    return response.body;
  }
  else
  {
    throw Exception("Error while reading data");
  }
}
Future<String> updateData(Article article) async{

  String address = Android;

  String url = "http://$address/api4flutter/update.php";
  http.Response response = await http.post(url, body: article.toJson());

  if(response.statusCode == 200){
    return response.body;
  }
  else
  {
    throw Exception("Error while reading data");
  }
}
Future<String> deleteData(Article article) async{

  String address = Android;

  String url = "http://$address/api4flutter/delete.php";
  http.Response response = await http.post(url, body: article.toJson());

  if(response.statusCode == 200){
    return response.body;
  }
  else
  {
    throw Exception("Error while reading data");
  }
}