import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_project/InstaClone_shared_login/Login_insta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home_insta extends StatefulWidget {
  @override
  State<Home_insta> createState() => _Home_instaState();
}

class _Home_instaState extends State<Home_insta> {
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

  var Images = [
    "assets/Images/story_insta.jpg",
    "assets/Images/story_insta.jpg",
    "assets/Images/story_insta.jpg",
    "assets/Images/story_insta.jpg",
    "assets/Images/story_insta.jpg",
    "assets/Images/story_insta.jpg",
    "assets/Images/story_insta.jpg",
    "assets/Images/story_insta.jpg",
    "assets/Images/story_insta.jpg",
    "assets/Images/story_insta.jpg",
  ];

  var posts = [
    "assets/Images/insta_post.jpeg",
    "assets/Images/insta_post.jpeg",
    "assets/Images/insta_post.jpeg",
    "assets/Images/insta_post.jpeg",
    "assets/Images/insta_post.jpeg",
    "assets/Images/insta_post.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.favorite_border),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.messenger),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                logindata.setBool("firstTimeLogin", true);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login_Insta(),
                  ),
                );
              },
              child: Text("Logout"),
            ),
          )
        ],
        title: Text(
          "Instagram",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.blue,
        activeColor: Colors.white,
        items: [
          TabItem(
            icon: Icons.home,
            title: 'Home',
          ),
          TabItem(icon: Icons.search, title: 'Search'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.video_collection, title: 'Reels'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                10,
                (index) => Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage("assets/Images/story_insta.jpg"),
                          ),
                          Text("User's name")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/Images/story_insta.jpg"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("Name of the person"),
                      ),
                      SizedBox(width: 140),
                      Icon(Icons.more_vert)
                    ],
                  ),
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/Images/insta_post.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.favorite_border),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.message),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.share),
                    ),
                    SizedBox(
                      width: 190,
                    ),
                    Icon(Icons.save_alt_outlined)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
