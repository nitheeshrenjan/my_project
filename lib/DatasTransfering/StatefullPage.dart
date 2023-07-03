import 'package:flutter/material.dart';

class StatefullPage extends StatefulWidget {
  final String? v1, v2;
  final int? v3;
  const StatefullPage({super.key, this.v1, this.v2, this.v3});

  @override
  State<StatefullPage> createState() => _StatefullPageState();
}

class _StatefullPageState extends State<StatefullPage> {
  @override
  Widget build(BuildContext context) {
    // Here we use the widget keyword to pass it to this build function
    String? v1 = widget.v1;
    return Scaffold(
      appBar: AppBar(
        title: Text(v1!),
      ),
      body: Center(
        child: Text("I am at ${widget.v2} and my contact is ${widget.v3}"),
      ),
    );
  }
}
