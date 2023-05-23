import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    useInheritedMediaQuery: true,
    home: GridView_Builder(),
  ));
}

class GridView_Builder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200),
        itemBuilder: (ctx, index) {
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Text("My Text"),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
