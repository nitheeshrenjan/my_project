import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_project/GridCustom.dart';
import 'package:my_project/GridExtend.dart';
import 'package:my_project/LoginPage.dart';
import 'package:my_project/statefulLogin.dart';

void main() {
  runApp(MaterialApp(
    home: BottomNav(),
  ));
}

class BottomNav extends StatefulWidget {
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom navigation"),
      ),

      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: index,
        backgroundColor: Colors.green,
        activeColor: Colors.amber,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        onTap: (tapindex) {
          setState(() {
            index = tapindex;
          });
        },
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.green,
      //   //type: BottomNavigationBarType.fixed, // For entire bottom bar TO BE A FIXED COLOR WITH LESS ANIMATIONS
      //   selectedItemColor: Colors.red,
      //   onTap: (tapIndex) {
      //     // to fetch the index that we click by using on tap property and then storing that value
      //     // into the variable index and later use it in the navigation bar
      //     setState(() {
      //       index = tapIndex;
      //     });
      //   },
      //   currentIndex:
      //       index, // to specify which index should have selection, Here the index is fetched with on tap
      //
      //   type: BottomNavigationBarType
      //       .shifting, // To switch from one to another like animations, color etc
      //
      //   // If its shifting, then we should specify each color for each item in bottom bar
      //
      //   items: [
      //     // WHEN WE SET THE BACKGROUND COLOR, THE LAST COLOR THAT WE HAVE SET BECOMES THE
      //     // DEFAULT ONE FOR THE REST OF THE BOTTOM NAV BAR
      //     //THIS IS APPLICABLE TO ONLY THE type: BottomNavigationBarType.shifting PROPERTY
      //
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.manage_accounts_rounded),
      //         // WE SHOULD ALWAYS SET THE LABEL PROPERTY, OTHERWISE IT WILL SHOW ERROR
      //         label: "Account",
      //         // Here the background color is amber, so when we click on it, the tab turns amber
      //         backgroundColor: Colors.amber),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.add),
      //         label: "Add",
      //         backgroundColor: Colors.blue),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.contacts_sharp),
      //         label: "Contact",
      //         backgroundColor: Colors.green),
      //     BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Name"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.add_a_photo), label: "Photo"),
      //   ],
      // ),

      body: screen[index],
    );
  }

  var screen = [
    // These are the different screens we have to call using the bottom bar section
    Grid_Extent(),
    GridCustom(),
    Login2(),
    LoginPage(),
    Grid_Extent(),
  ];
}
