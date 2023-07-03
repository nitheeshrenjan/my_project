import 'package:flutter/material.dart';
import 'package:my_project/DatasTransfering/dummyData.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //To fetch the values and store it in the productId variable
    //This takes values passed from arguments through routes
    final productId = ModalRoute.of(context)?.settings.arguments;

    //Here it first takes a value of Id from the main list and compares
    //it with the one that we have already saved in the productID
    //The datatype of this variable is map
    final productFromList =
        products.firstWhere((element) => element["id"] == productId);

    return Scaffold(
      appBar: AppBar(
        title: Text("My Wishlist"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(productFromList["image1"]),
            Text("${productFromList["price"]}"),
            Text(productFromList["description"])
          ],
        ),
      ),
    );
  }
}
