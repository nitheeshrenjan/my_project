import 'package:flutter/material.dart';

class StatelessPage extends StatelessWidget {
  // Here we can make the values required or optional according to our choice

  String? v1, v2;
  int? v3;
  StatelessPage({super.key, this.v1, this.v2, required this.v3});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(v1!),
      ),
      body: Center(
        child: Text("I am at $v2 and my contact is $v3"),
      ),
    );
  }
}
