import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ExpandedEx(),
  ));
}

class ExpandedEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.yellow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello",
              style: TextStyle(fontSize: 60),
            ),
            Icon(Icons.account_box_rounded),
            // We use expanded to avoid overflow
            // We use this instead of single child scrollview
            Expanded(
              child: Image(
                height: 700,
                image: AssetImage("assets/icons/dubai.jpg"),
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
