import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    useInheritedMediaQuery: true,
    home: List_View_Separator(),
    // theme: ThemeData(
    //     primarySwatch: Colors.green),
    // Gives the app full green theme
    theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(primary: Color.fromARGB(245, 7, 94, 84))),
    //theme: ThemeData.dark(),// for dark theme
  ));
}

class List_View_Separator extends StatelessWidget {
  var names = [
    'Nitheesh',
    'Ajeesh',
    'Bineesh',
    'Sudheesh',
    'Maneesh',
    'Dinesh',
    'Ratheesh'
  ];
  var phone = [
    9538798092,
    9857673879,
    9837265987,
    8873265879,
    8734658483,
    9837465893,
    7856879956
  ];
  var images = [
    'assets/icons/meme1.jpg',
    'assets/icons/meme2.jpg',
    'assets/icons/meme3.jpg',
    'assets/icons/meme4.jpg',
    'assets/icons/meme5.jpg',
    'assets/icons/meme6.jpg',
    'assets/icons/meme7.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Contacts"),
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: 12,
          ),
          Icon(Icons.camera_alt),
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Text("New group"),
                onTap: () {},
              ),
              PopupMenuItem(child: Text("New Broadcast")),
              PopupMenuItem(child: Text("Settings"))
            ];
          })
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(images[index]),
                ),
                title: Text(names[index]),
                subtitle: Text("${phone[index]}"),
              ),
            );
          },
          // To separate each card with A SPACE
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 3,
              color: Colors.blue,
            );
          },
          itemCount: names.length),
    );
  }
}
