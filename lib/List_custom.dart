import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    useInheritedMediaQuery: true,
    home: List_custom(),
  ));
}

class List_custom extends StatelessWidget {
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
        body: ListView.custom(
      // childrenDelegate: SliverChildListDelegate(
      //     [
      //   Card(
      //     color: Colors.red,
      //     child: Center(
      //       child: Icon(Icons.add),
      //     ),
      //   ),
      //   Card(
      //       color: Colors.blue,
      //       child: Center(
      //         child: Icon(Icons.add),
      //       )),
      //   Card(
      //       color: Colors.green,
      //       child: Center(
      //         child: Icon(Icons.add),
      //       )),
      //   Card(
      //       color: Colors.purple,
      //       child: Center(
      //         child: Icon(Icons.add),
      //       )),
      //   Card(
      //       color: Colors.yellow,
      //       child: Center(
      //         child: Icon(Icons.add),
      //       )),
      // ],

      // In this way also we can add the colors, using SliverChildListDelegate

      // List.generate(
      //     5,
      //     (index) => Card(
      //           color: colors[index],
      //           child: Center(
      //             child: Icon(Icons.add),
      //           ),
      //         )))),

      //This is another way in creating using builder

      childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => Card(
                color: colors[index],
                child: Center(
                  child: Icon(Icons.add),
                ),
              ),
          childCount: 4),
    ));
  }
}
