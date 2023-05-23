import 'package:flutter/material.dart';
import 'package:my_project/firstPage.dart';

class LoginPage extends StatelessWidget {
  //Presaved values
  String username = "nitheeshrenjan";
  String password = "abc123";

  //For fetching the values that we add on the text and save it in uname
  TextEditingController uname = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/icons/iconApp.png",
              height: 150,
              width: 120,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                //To tell the controller that we are adding this value to the u name
                controller: uname,
                decoration: InputDecoration(
                  helperText: 'Username must be an e-mail',
                  hintText: "Username",
                  labelText: "Username",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: pass,
                decoration: InputDecoration(
                    helperText: "Password must contain min 8 characters",
                    hintText: "Password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  String email = uname.text.trim();
                  String pwd = pass.text.trim();

                  if (email != "" && pass != "") {
                    if (username == email && password == pwd) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => FirstPage()));
                      // Goes back to the first page
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Username and password mismatch")));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Fields cannot be empty")));
                  }
                },
                child: Text('Login')),
            TextButton(
                onPressed: () {}, child: Text("Not a user?  Register here."))
          ],
        ),
      ),
    );
  }
}
