import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    useInheritedMediaQuery: true,
    home: GridView_Builder(),
  ));
}

class GridView_Builder extends StatelessWidget {
  var colors = [
    Colors.black12,
    Colors.black26,
    Colors.black45,
    Colors.black54,
    Colors.black,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GridView.count(
            crossAxisCount: 2,
            children: List.generate(
                5,
                (index) => Container(
                      color: colors[index],
                      child: Center(
                        child: Text("My Text"),
                      ),
                    ))));
  }
}
