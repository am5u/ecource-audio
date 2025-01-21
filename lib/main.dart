import 'package:flutter/material.dart';
import 'package:untitled2/screen/home_Page.dart';
void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      title: "Flutter adio recording",
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(
        primarySwatch:  Colors.blue
      ),
    home:  MyHomePage(),
    );
  }





}