import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'notemodel.dart';

class DBUtil {
  Database _db;

  Future<Database> initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'not.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );
  }

  void onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE notes2(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT)",
    );
  }

  Future<Database> get db async {
    if (_db == null) {
      _db = await initDatabase();
      return _db;
    } else {
      return _db;
    }
  }

  Future<int> create(Note note) async {
    var dbCheck = await db;
    return await dbCheck.rawInsert(
        'INSERT INTO notes2(title, content) VALUES("${note.title}","${note.content}")');
  }

  Future<Note> read(int id) async {
    var dbReady = await db;
    var read = await dbReady.rawQuery("SELECT * FROM notes2 WHERE id='$id'");
    return Note.fromMap(read[0]);
  }

  Future<int> update(Note note) async {
    var dbReady = await db;
    return await dbReady.rawInsert(
        'UPDATE notes2 SET title="${note.title}", content = "${note.content}" WHERE id="${note.id}"');
  }

  Future<int> delete(int id) async {
    var dbReady = await db;
    return await dbReady.rawInsert("DELETE FROM notes2 WHERE id = '$id'");
  }

  Future<List<Note>> readAll() async {
    var dbReady = await db;
    List<Map> list = await dbReady.rawQuery("SELECT * FROM notes2");
    List<Note> note = [];
    for (int i = 0; i < list.length; i++) {
      note.add(Note(
          id: list[i]['id'],
          title: list[i]['title'],
          content: list[i]['content']));
    }
    return note;
  }
}
