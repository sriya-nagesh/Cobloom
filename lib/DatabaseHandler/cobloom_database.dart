//Sriya Nagesh (SUKD1902368) BIT-UCLAN
// ignore_for_file: constant_identifier_names
//database for user login and registration
import 'package:cobloom/Model/new_user_record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DbHelper {
  static Database? _db;

  static const String DB_Name = 'cobloom.db';
  static const String Table_User = 'user';
  static const int Version = 1;

  static const String C_Email = 'email';
  static const String C_Username = 'user_name';
  static const String C_Password = 'password';

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $Table_User ("
        " $C_Email TEXT, "
        " $C_Username TEXT,"
        " $C_Password TEXT, "
        " PRIMARY KEY ($C_Email)"
        ")");
  }

  Future<int> saveData(NewUserRecord user) async {
    var dbClient = await db;
    var res = await dbClient!.insert(Table_User, user.toMap());
    return res;
  }

  Future<NewUserRecord?> getLoginUser(String email, String password) async {
    var dbClient = await db;
    var res = await dbClient!.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_Email = '$email' AND "
        "$C_Password = '$password'");

    if (res.isNotEmpty) {
      return NewUserRecord.fromMap(res.first);
    }

    return null;
  }

  Future<int> updateUser(NewUserRecord user) async {
    var dbClient = await db;
    var res = await dbClient!.update(Table_User, user.toMap(),
        where: '$C_Email = ?', whereArgs: [user.email]);
    return res;
  }
}
