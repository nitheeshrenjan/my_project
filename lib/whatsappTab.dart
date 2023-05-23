import 'package:flutter/material.dart';
import 'package:my_project/WhatsAppStatus.dart';
import 'package:my_project/whatsAppCall.dart';
import 'package:my_project/whatsAppChat.dart';
import 'package:my_project/whatsAppCommunity.dart';

void main() {
  runApp(MaterialApp(
    home: WhatsAppTab(),
    theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(primary: Color.fromARGB(245, 7, 94, 84))),
  ));
}

class WhatsAppTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // To return different pages to same screen like whats app
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
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
                  PopupMenuItem(child: Text("Settings")),
                  PopupMenuItem(child: Text("Payments")),
                  PopupMenuItem(child: Text("Linked Devices")),
                  PopupMenuItem(child: Text("Starred Messages"))
                ];
              })
            ],
            title: Text("WhatsApp"),
            bottom: TabBar(
                isScrollable: true,
                // TO ADJUST IT TO ICON SIZE
                labelPadding: EdgeInsets.zero,
                // To remove additional spaces on tabs
                indicatorSize: TabBarIndicatorSize.label,
                // To set whether its icon size or label size(10 PERCENTAGE OR 30 PERCENTAGE)
                tabs: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .1,
                    // to set its size to 10 percentage of total tab
                    child: Tab(
                      icon: Icon(Icons.people_alt_rounded),
                    ),
                  ),
                  SizedBox(
                    // to set its size to 30 percentage of total tab
                    width: MediaQuery.of(context).size.width * .3,
                    child: Tab(
                      child: Text(
                        "Chat",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .3,
                    child: Tab(
                      child: Text(
                        "Status",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .3,
                    child: Tab(
                      child: Text(
                        "Calls",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                ]),
          ),
          body: TabBarView(
            children: [
              // Use the classes that we have created corresponding to the pages that we need
              Community(),
              ChatScreen(),
              Status(),
              CallScreen()
            ],
          ),
        ));
  }
}
