import 'dart:convert';

import 'package:mone_note_app/domain/notes/note.dart';
import 'package:mone_note_app/domain/core/value_objects.dart';
import 'package:mone_note_app/infrastructure/notes/datasources/i_note_datasource.dart';

import 'package:injectable/injectable.dart';
import 'package:mone_note_app/infrastructure/notes/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(
    as: INoteLocalDatasource,
    env: [Environment.dev, Environment.test, Environment.prod])
@injectable
class SqfliteNoteLocalDatasource implements INoteLocalDatasource {
  static const String tableName = "notes";
  late final Database _database;

  SqfliteNoteLocalDatasource({required Database database})
      : _database = database;

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
    await _database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [note.id.getOrCrash()],
    );
  }

  @override
  Future<void> editNoteById({
    required UniqueId noteId,
    required String title,
    required String content,
  }) async {
    await _database.update(
      tableName,
      {
        'title': title,
        'content': content,
      },
      where: 'id = ?',
      whereArgs: [noteId.getOrCrash()],
    );
  }

  @override
  Future<List<Note>> getNotes() async {
    final List<Map<String, dynamic>> maps = await _database.query(tableName);

    return List.generate(maps.length, (i) {
      return NoteModel.fromJson(maps[i]).toDomain();
    });
  }

  @override
  Future<List<Note>> searchNotes({
    required String searchText,
  }) async {
    final List<Map<String, dynamic>> maps = await _database.query(
      tableName,
      where: "title LIKE ? OR content LIKE ?",
      whereArgs: ["%$searchText%", "%$searchText%"],
    );

    return List.generate(maps.length, (i) {
      return NoteModel.fromJson(maps[i]).toDomain();
    });
  }

  @override
  Future<void> addTagToNoteById(
      {required UniqueId noteId, required String tag}) async {
    final noteModel = await _database.query(
      tableName,
      where: 'id = ?',
      whereArgs: [noteId.getOrCrash()],
    );
    final currentTags =
        List<String>.from(jsonDecode(noteModel.first['tags'] as String));

    currentTags.add(tag);

    await _database.update(
      tableName,
      {
        'tags': jsonEncode(currentTags),
      },
      where: 'id = ?',
      whereArgs: [noteId.getOrCrash()],
    );
  }

  @override
  Future<void> deleteTagFromNoteById(
      {required UniqueId noteId, required String tag}) async {
    final noteModel = await _database.query(
      tableName,
      where: 'id = ?',
      whereArgs: [noteId.getOrCrash()],
    );
    final currentTags =
        List<String>.from(jsonDecode(noteModel.first['tags'] as String));

    currentTags.remove(tag);

    await _database.update(
      tableName,
      {
        'tags': jsonEncode(currentTags),
      },
      where: 'id = ?',
      whereArgs: [noteId.getOrCrash()],
    );
  }
}
