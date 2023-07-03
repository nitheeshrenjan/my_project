import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

class SQLHelper {
  /// 1. create database  db()
  static Future<sql.Database> db() async {
    // mytodo is the name of database
    return sql.openDatabase('mytodo.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  /// 2. create table with nametodo and column name as title and task
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE todo(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        C_title TEXT,
        C_description TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )""");
  }

  static Future<int> create_note(String title, String description) async {
    final db = await SQLHelper
        .db(); // Since database is a secured place and is in closed space. we need to open it
    ///Here we add the values we get from create note to the table columns
    final data = {"C_title": title, "C_description": description};
    final id = await db.insert("todo", data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  // To fetch all the datas from database
  static Future<List<Map<String, dynamic>>> getDatas() async {
    // This is done to open the db since its closed
    final db = await SQLHelper.db();
    // To return the table according to id. i.e all the values
    return db.query("todo", orderBy: "id");
  }

  //To get a single data with id
  static Future<List<Map<String, dynamic>>> getSingleData(int id) async {
    final db = await SQLHelper.db();
    return db.query("todo", where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateNote(
      int id, String title, String description) async {
    final db = await SQLHelper.db();
    final newdata = {
      'C_title': title,
      'C_description': description,
      'createdAt': DateTime.now().toString()
    };
    final newid =
        await db.update('todo', newdata, where: 'id =?', whereArgs: [id]);
    return newid;
  }

  static Future<void> deleteNote(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete('todo', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      debugPrint("$e Something went wrong");
    }
  }
}
