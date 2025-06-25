import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'package:recipefood/sql/sqlmodel.dart';

class DbHelper {

  static Database? _db;

  static const String DB_Name = 'sigup_database.db';
  static const String Table_sigup = 'sigup';
  static const int Version = 1;

  static const String uname = 'name';
  static const String uemail = 'email';
  static const String upassword = 'password';
  static const String ugender = 'gender';
  static const String uage = 'age';

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $Table_sigup ("
        " $uname TEXT, "
        " $uemail TEXT, "
        " $upassword TEXT,"
        " $ugender TEXT, "
        " $uage TEXT "
        ")");
  }

  Future<int> saveData(Signup sigup) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_sigup, sigup.toMap());
    return res;
  }

  Future<Signup> getLoginUser(String email, String password) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $Table_sigup WHERE "
        "$uemail = '$email' AND "
        "$upassword = '$password'");

    if (res.length > 0) {
      print(res);
      return Signup.fromMap(res.first);
    }

    throw Exception('Invalid email or password');
  }

  Future<int> updateUser(Signup sigup) async {
    var dbClient = await db;
    var res = await dbClient.update(Table_sigup, sigup.toMap(),
        where: '$uemail = ?', whereArgs: [sigup.email]);
    return res;
  }

  Future<int> deleteUser(String uemail) async {
    var dbClient = await db;
    var res = await dbClient
        .delete(Table_sigup, where: '$uemail = ?', whereArgs: [uemail]);
    return res;
  }
}
