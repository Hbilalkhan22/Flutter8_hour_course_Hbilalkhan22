import 'package:flutter/material.dart';
import 'widget/mydrawer.dart';

class MyHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text('CataLog App'),
        backgroundColor: Colors.deepPurple,
      ),

      body: Text('Hello World'),
      drawer: MyDrawer(),
    );
  }

}