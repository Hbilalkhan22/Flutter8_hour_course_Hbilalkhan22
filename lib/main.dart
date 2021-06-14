import 'package:flutter/material.dart';
import '/screens/login_page.dart';
import '/screens/home_page.dart';

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
      ),
      routes: {
        "/":(context) => MyHome(),
        "/login": (context) => LoginPage(),

      },

    );
  }

}