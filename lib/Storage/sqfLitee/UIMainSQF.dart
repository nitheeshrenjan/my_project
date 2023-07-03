import 'package:flutter/material.dart';

import 'SQLHelper.dart';

void main() {
  runApp(MaterialApp(
    home: HomePageUI(),
  ));
}

class HomePageUI extends StatefulWidget {
  @override
  State<HomePageUI> createState() => _HomePageUIState();
}

class _HomePageUIState extends State<HomePageUI> {
  bool isLoading = true;
  //To fetch the values from sqfLite
  List<Map<String, dynamic>> task = [];

  @override
  void initState() {
    refreshUi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Task"),
      ),
      // Check whether there is value or not
      // is loading means no value
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: task.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(task[index]["C_title"]),
                    subtitle: Text(task[index]['C_description']),
                    trailing: Wrap(
                      children: [
                        IconButton(
                          onPressed: () {
                            showSheet(task[index]["id"]);
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            deleteNote(task[index]["id"]);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showSheet(null),
        child: Icon(Icons.add),
      ),
    );
  }

  final title_controller = TextEditingController();
  final description_controller = TextEditingController();

  void showSheet(int? id) async {
    // To show the existing values into the text field for editing
    if (id != null) {
      final existingData = task.firstWhere((element) => element['id'] == id);
      title_controller.text = existingData['C_title'];
      description_controller.text = existingData['C_description'];
    }
    showModalBottomSheet(
      elevation: 5,
      // To work according to mediaQuery and scroll to top
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            // To avoid keyboard covering the textfield
            bottom: MediaQuery.of(context).viewInsets.bottom + 120),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: title_controller,
              decoration: InputDecoration(hintText: "Title"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: description_controller,
              decoration: InputDecoration(hintText: "Description"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                if (id == null) {
                  await createNote();
                }
                if (id != null) {
                  await updateNote(id);
                }
                title_controller.text = "";
                description_controller.text = "";
                Navigator.of(context).pop();
              },
              child: (id == null) ? Text("Create Note") : Text("Update Note"),
            )
          ],
        ),
      ),
    );
  }

// To add datas into todolist
  Future<void> createNote() async {
    await SQLHelper.create_note(
        title_controller.text, description_controller.text);
    refreshUi();
  }

  // To refresh the page according to the changes that we make in the list of datas
  void refreshUi() async {
    final data = await SQLHelper.getDatas();
    setState(() {
      //Task is the first empty list that we have created
      task = data;
      // made it false since there is a value in the page right now
      isLoading = false;
    });
  }

  Future<void> updateNote(int id) async {
    await SQLHelper.updateNote(
        id, title_controller.text, description_controller.text);
    refreshUi();
  }

  void deleteNote(int id) async {
    await SQLHelper.deleteNote(id);
    refreshUi();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Successfully deleted"),
      ),
    );
  }
}
