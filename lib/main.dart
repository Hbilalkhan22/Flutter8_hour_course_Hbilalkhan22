import 'package:flutter/material.dart';
import 'package:untitled/utils/routes/Myroutes.dart';
import 'package:untitled/widget/mythemes.dart';

import '/screens/login_page.dart';
import '/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      // home: MyHome(),
      color: Colors.deepPurple,


      darkTheme:MyThemes.lightTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.homeRoute:(context) => MyHome(),
        "/": (context) => LoginPage(),

      },

    );
  }

}