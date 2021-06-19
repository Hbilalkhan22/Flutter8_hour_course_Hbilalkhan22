import 'package:flutter/material.dart';
import 'package:untitled/screens/utils/routes/Myroutes.dart';
import '/screens/login_page.dart';
import '/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/widget/mythemes.dart';

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