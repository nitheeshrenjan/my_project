import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

void main() {
  runApp(MaterialApp(
    home: ClipEx(),
  ));
}

class ClipEx extends StatelessWidget {
  const ClipEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ClipRect(
            child: Align(
              alignment: Alignment.center,
              widthFactor: .2,
              heightFactor: .8,
              child: Image.network(
                  "https://images.unsplash.com/photo-1685884852440-b7e379c82c9c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=60"),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ClipRect(
            child: Align(
              alignment: Alignment.center,
              widthFactor: .5,
              heightFactor: .9,
              child: Image.network(
                  "https://images.unsplash.com/photo-1472214103451-9374bd1c798e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fGxhbmRzY2FwZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60"),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(80), bottomLeft: Radius.circular(70)),
            child: Image.network(
                "https://images.unsplash.com/photo-1472214103451-9374bd1c798e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fGxhbmRzY2FwZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60"),
          ),
          SizedBox(
            height: 30,
          ),
          ClipPath(
            clipper: RoundedDiagonalPathClipper(),
            child: Image.network(
                "https://images.unsplash.com/photo-1472214103451-9374bd1c798e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fGxhbmRzY2FwZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60"),
          )
        ],
      ),
    );
  }
}
