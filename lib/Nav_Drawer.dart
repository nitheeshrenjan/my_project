import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: NavDrawer(),
  ));
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NAV Drawer"),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.purple),
        child: Drawer(
          child: ListView(
            children: [
              //This is the inbuilt function to create the top area of navdrawer
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/dubai.jpg"),
                      fit: BoxFit.cover),
                ),
                accountName: Text("Nitheesh"),
                accountEmail: Text("nitheeshrenjan@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/icons/meme1.jpg"),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/icons/meme2.jpg"),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/icons/meme3.jpg"),
                  ),
                ],
              ),

              //CREATE MULTIPLE LIST TILES FOR EACH OPTIONS
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile"),
              ),
              ListTile(
                leading: Icon(Icons.wallet),
                title: Text("Wallet"),
              ),
              ListTile(
                leading: Icon(Icons.payment),
                title: Text("Payment"),
              ),
              ListTile(
                leading: Icon(Icons.chat),
                title: Text("Chat"),
              ),
              ListTile(
                leading: Icon(Icons.account_box_rounded),
                title: Text("Account box"),
              ),
              ListTile(
                leading: Icon(Icons.pageview_outlined),
                title: Text("Search"),
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text("Images"),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),
              //THIS IS USED TO CREATE A SPACE IN BETWEEN THE LIST TILE
              Divider(),

              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
