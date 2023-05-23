import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_project/statefulLogin.dart';

import 'LoginPage.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(
    MaterialApp(useInheritedMediaQuery: true, home: FirstPage()),
  );
}

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() =>
      _FirstPageState(); // to convert immutable FirstPage to mutable
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    try {
      Timer(Duration(seconds: 5), () {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Login2()));
        // This is used to go to next page from splash screen. Login page is the next page
        //We used push replacement because we don't need to come back to the splash screen
      });
    } catch (e, s) {
      print(s);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        // color: Colors.black12,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.white60,
          Colors.green,
        ], begin: Alignment.centerLeft, end: Alignment.centerRight)

            // image: DecorationImage(
            //     fit: BoxFit.cover,
            //     image: NetworkImage(
            //         "https://images.unsplash.com/photo-1614091199036-e934784dbf0f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80"))
            ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(
              //   Icons.access_alarm_outlined,
              //   size: 40,
              //   color: Colors.greenAccent,
              // ),// default icons in flutter
              // Image.asset(
              //   "assets/icons/iconApp.png",
              //   height: 100,
              //   width: 100,
              // ), // Images that we download from internet and paste in assets folder
              LottieBuilder.network(
                "https://assets2.lottiefiles.com/packages/lf20_bdwgn67r.json",
                height: 50,
                width: 50,
              ),
              Text(
                'My Page',
                style: GoogleFonts.caesarDressing(
                    color: Colors.greenAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                // style: TextStyle(
                //     fontSize: 50,
                //     color: Colors.greenAccent,
                //     fontWeight: FontWeight.bold,
                //     fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
