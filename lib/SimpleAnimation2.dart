import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SimpleAnimation2(),
    ),
  );
}

class SimpleAnimation2 extends StatefulWidget {
  const SimpleAnimation2({super.key});

  @override
  State<SimpleAnimation2> createState() => _SimpleAnimation2State();
}

// Here we apply mixin
class _SimpleAnimation2State extends State<SimpleAnimation2>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animation = Tween(begin: 12.0, end: 100.0).animate(controller!)
      ..addListener(() {
        setState(() {});
      });
  }

  void increaseSize() {
    controller!.forward();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            // Here the text size increases according the changes happening in the animation
            child: Text(
              "Hello All",
              style: TextStyle(fontSize: animation?.value),
            ),
          ),
          ElevatedButton(
            onPressed: () => increaseSize(),
            child: Text("Increase Size"),
          )
        ],
      ),
    );
  }
}
