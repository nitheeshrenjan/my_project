import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: FittedBoxEx()));
}

class FittedBoxEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.cover,
            alignment: Alignment.center,
            child: Container(
              color: Colors.amber,
              child: Row(
                children: [
                  Container(
                    child: Text("Fitted Box Example"),
                  ),
                  Container(
                    //height: MediaQuery.of(context).size.height,
                    child: Image.asset("assets/icons/dubai.jpg"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
