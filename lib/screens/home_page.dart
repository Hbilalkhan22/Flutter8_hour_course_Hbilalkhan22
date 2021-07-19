import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/screens/widget/mythemes.dart';
import 'dart:convert'; // provide json encoder and decoder
import 'widget/mydrawer.dart';
import 'widget/ItemWidget.dart';
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
                CatalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyThemes.darkBluishColor).make(),
        "Trending products".text.xl2.color(MyThemes.darkBluishColor).make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: catalogModel.item.length,
        itemBuilder: (context, index) {
          final catalog = catalogModel.item[index];
          return CatalogItem(catalog: catalog);
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(image: catalog.image),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyThemes.darkBluishColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              13.heightBox,
              ButtonBar(
                //it is used for insert many buttons

                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                MyThemes.darkBluishColor),
                            shape: MaterialStateProperty.all(
                              StadiumBorder(),
                            ),
                          ),
                          child: "Buy".text.make())
                      .pOnly(right: 8.0)
                ],
              )
            ],
          ),
        )
      ],
    )).white.square(150).rounded.make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image})
      : assert(image != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyThemes.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
