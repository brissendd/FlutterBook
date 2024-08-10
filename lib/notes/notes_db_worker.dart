import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import '../utils.dart' as utils;
import 'notes_model.dart';

class NotesDBWorker {
  NotesDBWorker._();
  static final NotesDBWorker db = NotesDBWorker._();
}

Database? _db;

Future get database async {
  _db ??= await init();
  return _db;
}

Future<Database> init() async {
  String path = join(utils.docsDir!.path, "notes.db");
  Database db = await openDatabase(
    path,
    version: 1,
    onOpen: (db) {},
    onCreate: (Database inDB, int inVersion) async {
      await inDB.execute('CREATE TABLE IF NOT EXISTS notes ('
          'id INTEGER PRIMARY KEY,'
          'title TEXT,'
          'content TEXT,'
          'color TEXT'
          ')');
    },
  );
  return db;
}

Note noteFromMap(Map inMap) {
  Note note = Note();
  note.id = inMap["id"];
  note.title = inMap["title"];
  note.content = inMap["content"];
  note.color = inMap["color"];
  return note;
}

Map<String, dynamic> noteToMap(Note inNote) {
  Map<String, dynamic> map = <String, dynamic>{};
  map["id"] = inNote.id;
  map["title"] = inNote.title;
  map["content"] = inNote.content;
  map["color"] = inNote.color;
  return map;
}
