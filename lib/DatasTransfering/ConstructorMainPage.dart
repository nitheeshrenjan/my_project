import 'package:flutter/material.dart';

import 'StatefullPage.dart';
import 'StatelessPage.dart';

void main() {
  runApp(MaterialApp(
    home: ConstructorMainPage(),
  ));
}

class ConstructorMainPage extends StatelessWidget {
  String name = "Nitheesh";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Constructor Page"),
      ),
      body: Container(
        alignment: Alignment.center,
        height: 250,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () =>
                  // We can pass arguments through push in this way
                  Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      // Here we are passing the values through the constructor.
                      StatelessPage(v1: name, v2: "kakkanad", v3: 8756875987),
                ),
              ),
              child: Text("Stateles Page"),
            ),

            //Stateful Page
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      // Here we are passing the values through the constructor.
                      StatefullPage(v1: name, v2: "kakkanad", v3: 8756875987),
                ),
              ),
              child: Text("Statelful Page"),
            )
          ],
        ),
      ),
    );
  }
}
