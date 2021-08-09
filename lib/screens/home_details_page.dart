import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled/models/catalog_model.dart';
import 'package:untitled/widget/mythemes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailsPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyThemes.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          //it is used for insert many buttons

          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
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
                .pOnly(right: 8.0).wh(100, 50)
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,

        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context).py4(),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.color(MyThemes.darkBluishColor).bold.make(),
                      catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                      13.heightBox,
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
