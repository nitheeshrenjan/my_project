import 'package:hive/hive.dart';

import '../model/user_model.dart';

class HiveDB {
  //This is the constructor
  HiveDB._internal();

  // instance is the object

  static HiveDB instance = HiveDB._internal();

  factory HiveDB() {
    // factory constructor for creating singleton class
    // This instance is an object name and can be given another name also
    return instance;
  }

  /// User is the name of the modal class
  Future<List<User>> getUser() async {
    // userdata is the box that we are creating
    final db = await Hive.openBox<User>("userdata");
    return db.values.toList();
  }
}
