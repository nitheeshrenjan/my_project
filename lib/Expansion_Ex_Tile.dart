import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Expansion(),
  ));
}

class Expansion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expansion tile"),
      ),
      body: ExpansionTile(
        title: Text("Colors"),
        subtitle: Text("Expand to view more"),
        children: [
          ListTile(
              leading: CircleAvatar(backgroundColor: Colors.purple),
              title: Text("Purple")),
          ListTile(
              leading: CircleAvatar(backgroundColor: Colors.green),
              title: Text("Green")),
          ListTile(
              leading: CircleAvatar(backgroundColor: Colors.blue),
              title: Text("Blue")),
          ListTile(
              leading: CircleAvatar(backgroundColor: Colors.black),
              title: Text("Black")),
        ],
      ),
    );
  }
}
