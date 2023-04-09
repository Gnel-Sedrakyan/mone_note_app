import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mone_note_app/domain/core/value_objects.dart';
import 'package:mone_note_app/domain/notes/i_note_repository.dart';
import 'package:mone_note_app/domain/notes/note.dart';
import 'package:mone_note_app/domain/notes/note_failure.dart';
import 'package:mone_note_app/infrastructure/notes/datasources/i_note_datasource.dart';

@LazySingleton(as: INoteRepository)
class NoteRepository implements INoteRepository {
  final INoteLocalDatasource noteLocalDataSource;

  NoteRepository({
    required this.noteLocalDataSource,
  });

  @override
  Future<Either<NoteFailure, List<Note>>> getSearchingNotes(
      {required String searchText}) async {
    try {
      final List<Note> noteFromLocalDatasource =
          await noteLocalDataSource.searchNotes(
        searchText: searchText,
      );
      return right(noteFromLocalDatasource);
    } catch (_) {
      return left(const NoteFailure.noteDoesNotExist());
    }
  }

  @override
  Future<Either<NoteFailure, List<Note>>> getNotes() async {
    try {
      final List<Note> noteFromLocalDatasource =
          await noteLocalDataSource.getNotes();
      return right(noteFromLocalDatasource);
    } catch (_) {
      return left(const NoteFailure.noteDoesNotExist());
    }
  }

  @override
  Future<Option<NoteFailure>> addNote({required Note note}) async {
    try {
      await noteLocalDataSource.addNote(note: note);
      return const None();
    } catch (_) {
      return const Some(NoteFailure.noteDoesNotExist());
    }
  }

  @override
  Future<Option<NoteFailure>> deleteNote({required Note note}) async {
    try {
      await noteLocalDataSource.deleteNote(note: note);
      return const None();
    } catch (_) {
      return const Some(NoteFailure.noteDoesNotExist());
    }
  }

  @override
  Future<Option<NoteFailure>> editNoteById({
    required UniqueId noteId,
    required String title,
    required String content,
  }) async {
    try {
      await noteLocalDataSource.editNoteById(
          noteId: noteId, title: title, content: content);
      return const None();
    } catch (_) {
      return const Some(NoteFailure.noteDoesNotExist());
    }
  }
}
