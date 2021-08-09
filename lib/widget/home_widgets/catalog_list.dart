import 'package:flutter/material.dart';
import 'package:untitled/screens/home_details_page.dart';
import 'package:untitled/widget/home_widgets/catalog_image.dart';
import 'package:untitled/widget/mythemes.dart';

import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog_model.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: catalogModel.item.length,
        itemBuilder: (context, index) {
          final catalog = catalogModel.item[index];
          return InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDetailsPage(catalog: catalog),
                    ),
                  ),
              child: CatalogItem(catalog: catalog));
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
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image),
        ),
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
