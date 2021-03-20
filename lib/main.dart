import 'package:flutter/material.dart';
import "package:homework_day3_app/page/mainpage.dart";
import 'package:homework_day3_app/page/my_listview2.dart';
import 'package:homework_day3_app/page/my_listviwe.dart';
import 'package:homework_day3_app/page/my_localapi_page.dart';
import 'package:homework_day3_app/page/randomuser_page.dart';
import 'package:homework_day3_app/page/randomuser_detialpage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyLocalAPIPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

