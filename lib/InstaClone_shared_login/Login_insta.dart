import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home_insta.dart';

void main() {
  runApp(
    MaterialApp(
      home: Login_Insta(),
    ),
  );
}

class Login_Insta extends StatefulWidget {
  @override
  State<Login_Insta> createState() => _Login_InstaState();
}

class _Login_InstaState extends State<Login_Insta> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  late SharedPreferences preferences;
  late bool newUser;

  @override
  void initState() {
    check_user_alreadyLogin();
    super.initState();
  }

  void check_user_alreadyLogin() async {
    preferences = await SharedPreferences.getInstance();
    newUser = preferences.getBool("firstTimeLogin") ?? true;
    if (newUser == false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home_insta(),
        ),
      );
    }
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Instagram",
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage("assets/icons/insta.jpg"),
              fit: BoxFit.cover,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20, bottom: 10),
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelText: "username"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20, bottom: 30),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelText: "password"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String u_name = username.text;
                String pass = password.text;

                if (u_name != "" && pass != "") {
                  preferences.setString("username", u_name);
                  preferences.setBool("firstTimeLogin", false);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home_insta(),
                    ),
                  );
                }
              },
              child: Text(
                "Login",
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(100, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
