import 'package:injectable/injectable.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

@module
abstract class InjectableModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  Future<Database> get database async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'notes.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE notes(
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
}
