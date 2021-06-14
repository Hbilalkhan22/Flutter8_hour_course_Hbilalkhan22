import 'package:flutter/material.dart';
import 'package:untitled/screens/utils/routes/Myroutes.dart';
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

      darkTheme: ThemeData(
        brightness: Brightness.light,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      routes: {
        MyRoutes.homeRoute:(context) => MyHome(),
        "/": (context) => LoginPage(),

      },

    );
  }

}