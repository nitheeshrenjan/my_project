import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ExitApp_Alert(),
  ));
}

class ExitApp_Alert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<bool> showAlert() async {
      //show Dialog is a built in function
      return await showDialog(
          context: context,
          // we should pass context in builder
          builder: (context) {
            return AlertDialog(
              title: Text("EXIT ??"),
              content: Text("Do you really want to exit ?"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text("Yes")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text("No")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text("Cancel")),
              ],
            );
          });
    }

    // We return WillPopScope to exit from app
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Alert and Exit"),
          ),
          body: Center(
            child: Text("Press back to exit"),
          ),
        ),
        onWillPop: showAlert);
  }
}
