import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_learn2/model/course.dart';

class DbHelper {
  Course ?co;
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;
  DbHelper.internal();
  static Database? db;

  Future<Database> createDatabase() async {
    if (db == null) {
      String path = join(await getDatabasesPath(), 'school');
      db = await openDatabase(path, version: 1, onCreate: onCreate, onUpgrade: onUpgrade);
    }
    return db!;
  }

  void onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE courses (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        content TEXT,
        hours INTEGER
      )
    ''');
    print('OnCreate--------------');
  }

  void onUpgrade(Database db, int oldVersion, int newVersion) {
    print('OnUpgrade--------------');
  }

  Future<int> createCourse(Course course) async {
    Database db = await createDatabase();
    return db.insert("courses", course.toMap());
  }

  Future<List<Map<String, dynamic>>> getAllCourses() async {
    Database db = await createDatabase();
    return db.query("courses");
  }

  Future<int> delete(int id) async {
    Database db = await createDatabase();
    return db.delete("courses", where: 'id = ?', whereArgs: [id]);
  }
    Future<int> update(Course course) async {
    Database db = await createDatabase();
    return db.update("courses",course.toMap(), where: 'id = ?', whereArgs: [course.id]);
  }
   
}