import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: BottomSheet(),
  ));
}

class BottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Sheet"),
      ),
      body: Center(
        // Gesture detector is used to create event to things that have no events,
        // We can also use inkwell
        child: GestureDetector(
          // Created a function showSheet so we can call it any time
          // We create it outside build function but inside the class so that we can access it inside this program
          onLongPress: () => showSheet(context),
          child: Icon(
            Icons.share,
            size: 50,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  void showSheet(BuildContext context) {
    // We need to pass the context here because it is outside the build function
    // If it was inside the build function, we need not pass the context
    //  IT IS BECAUSE CONTEXT IS AVAILABLE ONLY IN THE BUILD FUNCTION
    showModalBottomSheet(
        elevation: 3,
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              //We make this min, otherwise it will start from half of the page.
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  // We call font awesome icon for whats app, fb etc
                  // We added the font awesome dependency for this
                  leading: FaIcon(
                    FontAwesomeIcons.squareWhatsapp,
                    color: Colors.green,
                  ),
                  title: Text("WhatsApp"),
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.squareFacebook,
                    color: Colors.blue,
                  ),
                  title: Text("Facebook"),
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.message,
                    color: Colors.blue,
                  ),
                  title: Text("Message"),
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.telegram,
                    color: Colors.blueAccent,
                  ),
                  title: Text("Telegram"),
                ),
              ],
            ),
          );
        });
  }
}
