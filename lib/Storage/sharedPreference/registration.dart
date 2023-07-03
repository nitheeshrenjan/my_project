import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';

void main() {
  runApp(MaterialApp(home: LoginPage()));
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // To get values from the text field we are entering
  final uname_controller = TextEditingController();
  final pass_controller = TextEditingController();

  late SharedPreferences preferences;
  // To check whether the user already logged in or not
  late bool newUser;

  @override
  // At first it checks the state of the page by using init state
  void initState() {
    // Goes to the function
    check_user_alreadyLogin();
    super.initState();
  }

  void check_user_alreadyLogin() async {
    // Gets value from shared preference and stores it in the preference variable
    preferences = await SharedPreferences.getInstance();
    // If the user is already logged in, then newUser becomes false
    // If it is first time login, then the value is null, so we make it true
    newUser = preferences.getBool("firstTimeLogin") ?? true;

    // If the user already logged in, then it goes to next page
    if (newUser == false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    }
  }

  @override
  void dispose() {
    uname_controller.dispose();
    pass_controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "LoginPage",
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: uname_controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Username"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: pass_controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Password"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Creates a new variable and stores the data we type on the text box into it
                String username = uname_controller.text;
                String password = pass_controller.text;

                if (username != "" && password != "") {
                  //Stores the value into shared preference. Key is username
                  preferences.setString("username", username);
                  // Once logged in, then makes firstTimeLogin value false
                  preferences.setBool("firstTimeLogin", false);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                }
              },
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
