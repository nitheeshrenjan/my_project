import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:my_project/Storage/Hivee/Hive%202/model/user_model.dart';

import '../database/hivedb.dart';

class HiveRegistration extends StatelessWidget {
  TextEditingController remail = TextEditingController();
  TextEditingController rpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: remail,
              decoration: InputDecoration(
                hintText: "E-mail",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: rpassword,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              // We should create this class 'getuser' also
              // to fetch all the user from hive
              final userList = await HiveDB.instance.getUser();
              vadilateSignUp(userList);
              remail.text = "";
              rpassword.text = "";
            },
            child: Text("Register"),
          ),
        ],
      ),
    );
  }

  void vadilateSignUp(List<User> userList) async {
    final mail = remail.text.trim();
    final pwd = rpassword.text.trim();
    bool isUserFound = false;
    final validateEmail = EmailValidator.validate(mail);

    if (mail != "" && pwd != "") {
      if (validateEmail == true) {
        await Future.forEach(
          userList,
          (user) {
            // email is from modal class email
            if (user.email == mail) {
              isUserFound = true;
            } else {
              isUserFound = false;
            }
          },
        );
      }
    }
  }
}
