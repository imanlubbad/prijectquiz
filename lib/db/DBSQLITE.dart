import 'package:flutter/material.dart';
import 'package:quize/db/SharedPreferencesApp.dart';
import 'package:quize/model/QusetionModel.dart';
import 'package:quize/model/User.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static late Database _database;

  final String table = 'myTable';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnA = 'A';
  final String columnB = 'B';
  final String columnC = 'C';
  final String columnD = 'D';
  final String columnS = 'S';

  ///UserColumn
  final String columnid = 'id';
  final String columnname = 'name';
  final String columnemail = 'email';
  final String columnpassword = 'password';

  DatabaseHelper.internal();

  Future<Database> get database async {
    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String paths = path.join(documentsDirectory.path, 'myDatabase.db');
    return await openDatabase(
      paths,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
      CREATE TABLE "user" (
      $columnid INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT,
      $columnname TEXT NOT NULL,
      $columnemail TEXT NOT NULL,
      $columnpassword TEXT NOT NULL
      );
      ''');
        await db.execute(
          '''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT,
            $columnA TEXT,
            $columnB TEXT,
            $columnC TEXT,
            $columnD TEXT,
            $columnS TEXT
          )
          ''',
        );
      },
    );
  }

  ///QusetionCRUD
  Future<int> insertQusetion(QusetionModel item) async {
    Database db = await database;
    return await db.insert(table, item.toMap());
  }

  Future<List<QusetionModel>> getQusetion() async {
    List<QusetionModel> temp = [];
    Database db = await database;
    List<Map> maps = await db.query(table);
    maps.forEach((element) {
      if (!temp.contains(QusetionModel.FromJs(element))) {
        temp.add(QusetionModel.FromJs(element));
      }
    });
    return temp;
  }

  Future<int> updateQusetion(QusetionModel item) async {
    Database db = await database;
    return await db.update(
      table,
      item.toMap(),
      where: '$columnId = ?',
      whereArgs: [item.id],
    );
  }

  Future<int> deleteQusetion(int id) async {
    Database db = await database;
    return await db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  ///USER CRUD
  Future<int> insertUser(User user,context) async {
    final dbClient = await database;
    final result = await dbClient.query(
      'user',
      where: 'email = ? AND password = ?',
      whereArgs: [user.email, user.password],
    );
    if(result.isNotEmpty){
      final SnackBar snackBar = SnackBar(content: Text("This email is exist"),backgroundColor: Colors.red,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return 0;
    }else{
      final SnackBar snackBar = SnackBar(content: Text("Successfluy add user"),backgroundColor: Colors.green,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return await dbClient.insert('user', user.toMap());
    }
   }

  Future<User?> getUser(int id) async {
    final dbClient = await database;
    final result =
        await dbClient.query('user', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? User.fromMap(result.first) : null;
  }

  Future<List<User>> getAllUsers() async {
    final dbClient = await database;
    final result = await dbClient.query('user');
    return result.map((map) => User.fromMap(map)).toList();
  }

  Future<int> updateUser(User user) async {
    final dbClient = await database;
    return await dbClient
        .update('user', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  }

  Future<int> deleteUser(int id) async {
    final dbClient = await database;
    return await dbClient.delete('user', where: 'id = ?', whereArgs: [id]);
  }

  Future<User> getUserByEmailAndPassword(String email, String password,context) async {
    final dbClient = await database;
    final result = await dbClient.query(
      'user',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (result.isNotEmpty) {
      User user =User.fromMap(result.first);
      SharedPreferencesApp().SaveDataUser(user);
      return  user;
    } else {
      final SnackBar snackBar = SnackBar(content: Text("invalid email or password"),backgroundColor: Colors.red,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return User();
    }
  }
}
