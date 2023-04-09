import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mone_note_app/domain/core/value_objects.dart';
import 'package:mone_note_app/domain/notes/note.dart';
import 'package:mone_note_app/infrastructure/notes/datasources/note_local_datasource.dart';
import 'package:mone_note_app/infrastructure/notes/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

import 'note_local_database_test.mocks.dart';

@GenerateMocks([Database])
void main() {
  group('SqfliteNoteLocalDatasource', () {
    late SqfliteNoteLocalDatasource datasource;
    late MockDatabase mockDatabase;

    setUp(() {
      mockDatabase = MockDatabase();
      datasource =
          SqfliteNoteLocalDatasource(database: Future.value(mockDatabase));
    });

    final note = Note(
      id: UniqueId(),
      title: 'Test note',
      content: 'This is a test note.',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final noteModel = NoteModel.fromDomain(note);

    test(
        'searchNotes() should call query on the database with the correct arguments',
        () async {
      const searchText = 'test';
      final expectedNotes = [
        Note(
          id: UniqueId(),
          title: 'Test Note 1',
          content: 'This is a test note.',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        Note(
          id: UniqueId(),
          title: 'Test Note 2',
          content: 'This is another test note.',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];
      when(mockDatabase.query(
        'notes',
        where: 'title LIKE ? OR content LIKE ?',
        whereArgs: ['%$searchText%', '%$searchText%'],
      )).thenAnswer((_) async => [
            {
              'id': expectedNotes[0].id.getOrCrash(),
              'title': expectedNotes[0].title,
              'content': expectedNotes[0].content,
              'created_at': expectedNotes[0].createdAt.toIso8601String(),
              'updated_at': expectedNotes[0].updatedAt.toIso8601String(),
            },
            {
              'id': expectedNotes[1].id.getOrCrash(),
              'title': expectedNotes[1].title,
              'content': expectedNotes[1].content,
              'created_at': expectedNotes[1].createdAt.toIso8601String(),
              'updated_at': expectedNotes[1].updatedAt.toIso8601String(),
            },
          ]);

      final result = await datasource.searchNotes(searchText: searchText);
      verify(mockDatabase.query(
        'notes',
        where: 'title LIKE ? OR content LIKE ?',
        whereArgs: ['%$searchText%', '%$searchText%'],
      ));
      expect(result, expectedNotes);
    });

    test(
        'deleteNote() should call delete on the database with the correct arguments',
        () async {
      when(mockDatabase.delete('notes',
              where: 'id = ?', whereArgs: anyNamed('whereArgs')))
          .thenAnswer((_) async => 1);

      await datasource.deleteNote(
        note: note,
      );
      verify(mockDatabase.delete(
        'notes',
        where: 'id = ?',
        whereArgs: [note.id.getOrCrash()],
      ));
    });
  });
}
