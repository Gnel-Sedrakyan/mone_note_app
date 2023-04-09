import 'package:mone_note_app/domain/notes/note.dart';
import 'package:mone_note_app/domain/core/value_objects.dart';
import 'package:mone_note_app/infrastructure/notes/datasources/i_note_datasource.dart';

import 'package:injectable/injectable.dart';
import 'package:mone_note_app/infrastructure/notes/models/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(
    as: INoteLocalDatasource, env: [Environment.dev, Environment.test])
class SqfliteNoteLocalDatasource implements INoteLocalDatasource {
  static const String tableName = "notes";
  late final Future<Database> _database;

  SqfliteNoteLocalDatasource({required Future<Database> database})
      : _database = database;

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'notes.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE $tableName(
                id TEXT PRIMARY KEY,
                title TEXT,
                content TEXT,
                created_at TEXT,
                updated_at TEXT
              )''',
        );
      },
    );
  }

  @override
  Future<void> addNote({
    required Note note,
  }) async {
    final db = await _database;
    final model = NoteModel.fromDomain(note);

    await db.insert(
      tableName,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> deleteNote({
    required Note note,
  }) async {
    final db = await _database;

    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [note.id.getOrCrash()],
    );
  }

  @override
  Future<void> editNoteById({
    required UniqueId noteId,
    required Note editedNote,
  }) async {
    final db = await _database;
    final model = NoteModel.fromDomain(editedNote);

    await db.update(
      tableName,
      model.toJson(),
      where: 'id = ?',
      whereArgs: [noteId.getOrCrash()],
    );
  }

  @override
  Future<List<Note>> getNotes() async {
    final db = await _database;

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return NoteModel.fromJson(maps[i]).toDomain();
    });
  }

  @override
  Future<List<Note>> searchNotes({
    required String searchText,
  }) async {
    print(1);
    final db = await _database;
    print(2);
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: "title LIKE ? OR content LIKE ?",
      whereArgs: ["%$searchText%", "%$searchText%"],
    );
    print(db);

    return List.generate(maps.length, (i) {
      return NoteModel.fromJson(maps[i]).toDomain();
    });
  }
}
