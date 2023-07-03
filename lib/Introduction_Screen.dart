import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:my_project/LoginPage.dart';
import 'package:my_project/statefulLogin.dart';

void main() {
  runApp(MaterialApp(
    home: IntroScreen(),
  ));
}

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "First Page",
          body: "Introduction to the body",
          image: introImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVv_NLgONGe_Cpht4K14DOwxLEI7Yb-Qf6bw&usqp=CAU"),
        ),
        PageViewModel(
          title: "Second Page",
          body: "Introduction to the body",
          // We set it as footer to add it into the bottom side of the page
          footer: introImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVv_NLgONGe_Cpht4K14DOwxLEI7Yb-Qf6bw&usqp=CAU"),
        ),
        PageViewModel(
          title: "Third Page",
          body: "Introduction to the body",
          image: introImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVv_NLgONGe_Cpht4K14DOwxLEI7Yb-Qf6bw&usqp=CAU"),
        ),
      ],
      onDone: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Login2(),
          ),
        );
      },
      onSkip: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
      // We should either show skip or else we should show back button
      showSkipButton: true,
      //we should add text or image to skip if we add showSkip as true
      skip: Text("Skip"),
      next: Icon(Icons.arrow_forward_outlined),
      done: Text("Done"),
      dotsDecorator: DotsDecorator(
        size: Size(12, 10),
        color: Colors.blue,
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

Widget introImage(String image) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Image.network(
      image,
      width: 300,
    ),
  );
}
