// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:convert'; // provide json encoder and decoder
// import 'widget/mydrawer.dart';
// import 'widget/ItemWidget.dart';
// import '../models/catalog_model.dart';
//
// class MyHome extends StatefulWidget {
//   @override
//   State<MyHome> createState() => _MyHomeState();
// }
//
// class _MyHomeState extends State<MyHome> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loadData();
//   }
//
//   loadData() async {
//     await Future.delayed(Duration(seconds: 2));
//     var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
//     var decodeData = jsonDecode(catalogJson);
//     var productData = decodeData["products"];
//     catalogModel.item =
//         List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
//     setState(() {
//
//     });
//     // print(productData);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     // final dumnyList = List.generate(50, (index) => catalogModel.item[0]);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Catalog App'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: (catalogModel.item != null && catalogModel.item.isNotEmpty)
//             ?ListView.builder(
//           // itemCount: catalogModel.item.length,
//           itemCount: catalogModel.item.length,
//           itemBuilder: (context, index) {
//             return ItemWidget(item: catalogModel.item[index]);
//           },
//         ): Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//       drawer: MyDrawer(),
//     );
//   }
// }

// grid view code

// Padding(
// padding: const EdgeInsets.all(12.0),
// child: (catalogModel.item != null && catalogModel.item.isNotEmpty)
// ? GridView.builder(
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// crossAxisSpacing: 16,
// mainAxisSpacing: 16,
// ),
// itemBuilder: (context, index) {
// final item = catalogModel.item[index];
// return Card(
// clipBehavior: Clip.antiAlias,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10),
// ),
// child: GridTile(
// header: Container(child: Text(item.name,style: TextStyle(color: Colors.white),),
// decoration: BoxDecoration(
// color: Colors.purple,
//
// ),
// padding: const EdgeInsets.all(12),
// ),
// child: Image.network(item.image),
// footer: Container(child: Text(item.price.toString(),style: TextStyle(color: Colors.white),),
// decoration: BoxDecoration(
// color: Colors.black ,
//
// ),
// padding: const EdgeInsets.all(12),
// ),
// ),
// );
// },
// itemCount: catalogModel.item.length,
// )
// : Center(
// child: CircularProgressIndicator(),
// ),
// ),
// drawer: MyDrawer(),
