import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    useInheritedMediaQuery: true,
    home: StackEx(),
  ));
}

class StackEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              color: Colors.tealAccent,
              height: 200,
              width: 200,
            ),
            Container(color: Colors.green, height: 150, width: 150),
            Container(color: Colors.black54, height: 100, width: 100),
            Positioned(
                // This will give 150 space to top and 150 to left
                top: 150,
                left: 150,
                child: Container(color: Colors.blueGrey, height: 50, width: 50))
          ],
          // children: [
          //   Container(
          //     color: Colors.tealAccent,
          //   ),
          //   Container(
          //     color: Colors.green,
          //   ),
          //   Container(
          //     color: Colors.black54,
          //   ),
          //   Container(
          //     color: Colors.blueGrey,
          //   )
          //   // The result will show a mix of these colors on top of each other
          // ],
        ),
      ),
    );
  }
}
