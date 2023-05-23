import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    useInheritedMediaQuery: true,
    home: ChatScreen(),
  ));
}

class ChatScreen extends StatelessWidget {
  var names = [
    'Nitheesh',
    'Ajeesh',
    'Bineesh',
    'Sudheesh',
    'Maneesh',
    'Dinesh',
    'Ratheesh',
    'Nitheesh',
    'Ajeesh',
    'Bineesh',
    'Sudheesh',
  ];
  var message = [
    "How are you",
    " Not yet",
    "Ok aayittila",
    "Kazhinju",
    "Ivda mazha und",
    "Nalla chiri",
    "Boring",
    "Busy",
    "Good night",
    "Good evening",
    "Naala kaanam"
  ];
  var images = [
    'assets/icons/meme1.jpg',
    'assets/icons/meme2.jpg',
    'assets/icons/meme3.jpg',
    'assets/icons/meme4.jpg',
    'assets/icons/meme5.jpg',
    'assets/icons/meme6.jpg',
    'assets/icons/meme7.jpg',
    'assets/icons/meme1.jpg',
    'assets/icons/meme2.jpg',
    'assets/icons/meme3.jpg',
    'assets/icons/meme4.jpg',
  ];

  var time = [
    "3 : 20 PM",
    "12 : 44 PM",
    "10 : 20 AM",
    "9 : 20 AM",
    "12 : 40 AM",
    "11 : 49 PM",
    "7 : 26 PM",
    "7 : 09 PM",
    "5 :20 PM",
    "2 : 40 PM",
    "15 : 20 PM",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(245, 7, 94, 84),
          onPressed: () {},
          child: Icon(
            Icons.message,
            size: 30,
          )),
      // appBar: AppBar(
      //   toolbarHeight: 70,
      //   actions: [
      //     Icon(Icons.camera_alt),
      //     SizedBox(width: 10),
      //     Icon(Icons.search),
      //     SizedBox(width: 10),
      //     Icon(Icons.menu),
      //     SizedBox(width: 10),
      //   ],
      //   backgroundColor: Color.fromARGB(245, 7, 94, 84),
      //   title: Text(
      //     "WhatsApp",
      //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true, // to adjust the Screen according to list
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      names[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(message[index]),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(images[index]),
                    ),
                    trailing: Text(
                      time[index],
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                );
              },
              itemCount: names.length,
            ),
          ],
        ),
      ),
    );
  }
}
