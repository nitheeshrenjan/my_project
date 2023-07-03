import 'package:flutter/material.dart';
import 'package:my_project/DatasTransfering/dummyData.dart';

import 'ProductDetails.dart';

void main() {
  runApp(MaterialApp(
    home: ProductScreen(),
    routes: {
      "second": (context) => ProductDetails(),
    },
  ));
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop App"),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        // Since it is a list of maps. we fetch each map
        children: products
            .map(
              (element) => ListTile(
                  leading: Image.network("${element["image1"]}"),
                  title: Text("${element["name"]}"),
                  subtitle: Text("\$${element["price"]}"),
                  // This is created to go to next page on clicking
                  //This is similar to navigator
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed("second", arguments: element["id"]);
                  }),
            )
            .toList(),
      ),
    );
  }

  //  void gotoNext(BuildContext context, elementId) {
  //   Navigator.of(context).pushNamed("second", arguments: elementId);
  // }
}
