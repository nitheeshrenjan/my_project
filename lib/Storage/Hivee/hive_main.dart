import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('todo_box');
  runApp(MaterialApp(
    home: CRUD_hive(),
  ));
}

class CRUD_hive extends StatefulWidget {
  const CRUD_hive({super.key});

  @override
  State<CRUD_hive> createState() => _CRUD_hiveState();
}

class _CRUD_hiveState extends State<CRUD_hive> {
  List<Map<String, dynamic>> task = [];
  final title = TextEditingController();
  final taskname = TextEditingController();

  // Creating an object of hive

  final my_box = Hive.box('todo_box');

  @override
  void initState() {
    readTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive Crud"),
      ),
      body: task.isEmpty
          ? Text("No data")
          : ListView.builder(
              itemCount: task.length,
              itemBuilder: (context, index) {
                // Here we take each map and store in mytask so we can call it with key
                final mytask = task[index];
                return Card(
                  child: ListTile(
                    title: Text(mytask['task_name']),
                    subtitle: Text(mytask['task_content']),
                    trailing: Wrap(
                      children: [
                        IconButton(
                          onPressed: () {
                            showTask(context, mytask['id']);
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            deleteTask(mytask['id']);
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
        onPressed: () => showTask(context, null),
        child: Icon(Icons.task),
      ),
    );
  }

  // itemkey is similar to id in SQFlite
  void showTask(BuildContext context, int? itemkey) {
    if (itemkey != null) {
      // The name 'id' that we define here should have the same name as the one we define in hive
      final existing_task =
          task.firstWhere((element) => element['id'] == itemkey);
      title.text = existing_task['task_name'];
      taskname.text = existing_task['task_content'];
    }

    showModalBottomSheet(
      elevation: 5,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 120),
          child: Column(
            // To make the bottom sheet to center
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: title,
                decoration: InputDecoration(hintText: "Task Name"),
              ),
              TextField(
                controller: taskname,
                decoration: InputDecoration(hintText: "Task content"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (itemkey == null) {
                    createTask({
                      "task_name": title.text.trim(),
                      'task_content': taskname.text.trim()
                    });
                  }
                  if (itemkey != null) {
                    updateTask(itemkey, {
                      "task_name": title.text.trim(),
                      'task_content': taskname.text.trim()
                    });
                  }
                  title.text = "";
                  taskname.text = "";
                  Navigator.of(context).pop();
                },
                child: Text(itemkey == null ? "Create task" : "Update task"),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> createTask(Map<String, dynamic> newtask) async {
    await my_box.add(newtask);
    // We should read the task since it should be displayed in our UI.
    readTask();
  }

  void readTask() {
    // all keys from hive is fetched is ascending order
    final task_from_hive = my_box.keys.map((key) {
      // Here the value gets all the values from the database using the key and stores in value
      final value = my_box.get(key);
      return {
        // Here we assign each value we get using the key to the database in ascending order
        'id': key,
        'task_name': value['task_name'],
        'task_content': value['task_content']
      };
      // Since the value we get is a map, we should convert it into list
    }).toList();

    setState(() {
      // We are adding it to task list.
      // we should reverse it since it was arranged in ascending order
      // if we do not reverse it then it will show first added item in the last row
      task = task_from_hive.reversed.toList();
    });
  }

  Future<void> updateTask(int itemkey, Map<String, dynamic> uptask) async {
    await my_box.put(itemkey, uptask);
    readTask(); // This is same as refresh ui
  }

  Future<void> deleteTask(int itemkey) async {
    await my_box.delete(itemkey);
    readTask();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Succesfully deleted"),
      ),
    );
  }
}
