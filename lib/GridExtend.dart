import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(useInheritedMediaQuery: true, home: Grid_Extent()));
}

class Grid_Extent extends StatelessWidget {
  var colors = [
    Colors.green,
    Colors.red,
    Colors.purpleAccent,
    Colors.yellow,
    Colors.purple,
    Colors.green,
    Colors.red,
    Colors.purpleAccent,
    Colors.yellow,
    Colors.purple,
    Colors.green,
    Colors.red,
    Colors.purpleAccent,
    Colors.yellow,
    Colors.purple,
    Colors.green,
    Colors.red,
    Colors.purpleAccent,
    Colors.yellow,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.extent(
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        maxCrossAxisExtent: 50,
        children: List.generate(
            20,
            (index) => Stack(
                  children: [
                    Container(
                      color: colors[index],
                    ),
                    Center(
                      child: Icon(
                        Icons.ac_unit_sharp,
                        size: 15,
                      ),
                    )
                  ],
                )),
      ),
    );
  }
}
