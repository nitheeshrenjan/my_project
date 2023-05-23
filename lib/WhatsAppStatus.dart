import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/icons/iconApp.png"),
              ),
              title: Text(
                "My Status",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 17,
              color: Colors.black12,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Recent Updates",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/icons/meme1.jpg"),
              ),
              title: Text("Nitheesh"),
              subtitle: Text("7 : 32 PM"),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/icons/meme2.jpg"),
              ),
              title: Text("Maneesh"),
              subtitle: Text("6 : 52 PM"),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/icons/meme3.jpg"),
              ),
              title: Text("Ajeesh"),
              subtitle: Text("5 : 45 PM"),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 17,
              color: Colors.black12,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Viewed Updates",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/icons/meme4.jpg"),
              ),
              title: Text("Sudeesh"),
              subtitle: Text("4 : 25 PM"),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/icons/meme5.jpg"),
              ),
              title: Text("Hareesh"),
              subtitle: Text("3 : 23 PM"),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/icons/meme6.jpg"),
              ),
              title: Text("Dinesh"),
              subtitle: Text("2 : 32 PM"),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/icons/meme7.jpg"),
              ),
              title: Text("Ratheesh"),
              subtitle: Text("1 : 21 PM"),
            ),
          ],
        ),
      ),
    );
  }
}
