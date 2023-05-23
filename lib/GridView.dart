import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    useInheritedMediaQuery: true,
    home: Grid1(),
  ));
}

class Grid1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            childAspectRatio: 1),
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.amber,
                boxShadow: [
                  BoxShadow(
                      color: Colors.blueGrey,
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: Offset(2, 8))
                ]),
            child: Center(
              child: Text("My Card"),
            ),
          ),
          Card(
            color: Colors.tealAccent,
            child: Center(
              child: Text("My Card"),
            ),
          ),
          Card(
            color: Colors.yellow,
            child: Center(
              child: Text("My Card"),
            ),
          ),
          Card(
            color: Colors.lightBlue,
            child: Center(
              child: Text("My Card"),
            ),
          ),
          Card(
            color: Colors.greenAccent,
            child: Center(
              child: Text("My Card"),
            ),
          ),
          Card(
            color: Colors.black26,
            child: Center(
              child: Text("My Card"),
            ),
          ),
          Card(
            color: Colors.orange,
            child: Center(
              child: Text("My Card"),
            ),
          ),
        ],
      ),
    );
  }
}
