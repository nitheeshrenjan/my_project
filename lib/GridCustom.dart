import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: GridCustom(),
    ),
  );
}

class GridCustom extends StatefulWidget {
  @override
  State<GridCustom> createState() => _GridCustomState();
}

class _GridCustomState extends State<GridCustom> {
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
      body: GridView.custom(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 20, crossAxisSpacing: 20, crossAxisCount: 3),
          childrenDelegate: SliverChildListDelegate(List.generate(
              15,
              (index) => Card(
                    color: colors[index],
                  )))),
    );
  }
}
