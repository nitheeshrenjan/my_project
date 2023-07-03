import 'package:flutter/material.dart';
import 'package:my_project/Storage/sharedPreference/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SharedPreferences logindata;
  late String username;

  @override
  void initState() {
    userdata();
    super.initState();
  }

  void userdata() async {
    logindata = await SharedPreferences.getInstance();
    setState(
      () {
        username = logindata.getString("username")!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "Welcome $username ",
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
                onPressed: () {
                  logindata.setBool("firstTimeLogin", true);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
