import 'package:flutter/material.dart';
import 'package:my_project/firstPage.dart';

class Login2 extends StatefulWidget {
  const Login2({Key? key}) : super(key: key);

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  var formkey = GlobalKey<FormState>(); // to fetch the state of the form
  bool showpwd = true; // set as true because obscure text needs to be true,
  // i.e password must not be shown while typing

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful"),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: formkey, // Setting the form key in form
            child: Column(
              children: [
                const Center(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Login Page",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontStyle: FontStyle.italic),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // Username text field
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter email id",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      prefixIcon: Icon(Icons.email),
                    ),
                    // To check whether the format of input values are correct
                    validator: (uname) {
                      if (uname!.isEmpty || !uname.contains('@')) {
                        return "Enter a valid email";
                      } else {
                        return null; // else part always returns a null value
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  //Password Text field
                  child: TextFormField(
                    obscureText: showpwd,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        hintText: 'Enter password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (showpwd) {
                                  showpwd = false;
                                } else {
                                  showpwd = true;
                                }
                              });
                            },
                            icon: Icon(showpwd == true
                                ? Icons.visibility_off
                                : Icons.visibility))),

                    // To check whether the format of input values are correct
                    validator: (pass) {
                      if (pass!.isEmpty || pass.length < 6) {
                        return 'Not a valid password';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(100, 40)),
                    onPressed: () {
                      // Checks the conditions that we have set in the validation.
                      final valid = formkey.currentState!.validate();
                      if (valid) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FirstPage()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('Enter correct username and password')));
                      }
                    },
                    child: Text("Login")),
                TextButton(onPressed: () {}, child: Text("Sign Up")),
              ],
            )),
      ),
    );
  }
}
