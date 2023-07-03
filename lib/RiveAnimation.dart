import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(MaterialApp(home: SimpleAnimation()));
}

class SimpleAnimation extends StatelessWidget {
  const SimpleAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 200,
            width: 100,
            child: RiveAnimation.network(
              'https://cdn.rive.app/animations/vehicles.riv',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 200,
            width: 100,
            child: RiveAnimation.asset(
              'assets/animations/saturnRive.riv',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
