import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MaterialApp(
    home: LottieAnnimation(),
  ));
}

class LottieAnnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lottie Animation"),
      ),
      body: Container(
        child: Lottie.asset("assets/animations/welcome-animation.json",
            fit: BoxFit.cover),
      ),
    );
  }
}
