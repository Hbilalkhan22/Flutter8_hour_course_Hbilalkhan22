import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/widget/home_widgets/catalog_header.dart';
import 'package:untitled/widget/home_widgets/catalog_list.dart';
import 'package:untitled/widget/mythemes.dart';

import 'dart:convert'; // provide json encoder and decoder

import '../models/catalog_model.dart';
import 'package:velocity_x/velocity_x.dart';

class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    catalogModel.item =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
    // print(productData);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // final dumnyList = List.generate(50, (index) => catalogModel.item[0]);
    return Scaffold(
      backgroundColor: MyThemes.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32, //actually will apply padding from all side 32 .
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (catalogModel.item != null && catalogModel.item.isNotEmpty)
                CatalogList().py16().expand()
              else
                 CircularProgressIndicator().centered().expand(),

            ],
          ),
        ),
      ),
    );
  }
}






