import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mone_note_app/domain/core/value_objects.dart';
import 'package:mone_note_app/domain/notes/i_note_repository.dart';
import 'package:mone_note_app/domain/notes/note.dart';
import 'package:mone_note_app/domain/notes/note_failure.dart';
import 'package:mone_note_app/infrastructure/notes/datasources/i_note_datasource.dart';

@LazySingleton(as: INoteRepository)
class NoteRepository implements INoteRepository {
  final INoteLocalDatasource NoteLocalDataSource;

  NoteRepository({
    required this.NoteLocalDataSource,
  });

  @override
  Future<Either<NoteFailure, List<Note>>> getSearchingNotes(
      {required String searchText}) async {
    try {
      final List<Note> NoteFromLocalDatasource =
          await NoteLocalDataSource.searchNotes(
        searchText: searchText,
      );
      return right(NoteFromLocalDatasource);
    } catch (_) {
      return left(const NoteFailure.noteDoesNotExist());
    }
  }

  @override
  Future<Either<NoteFailure, List<Note>>> getNotes() async {
    try {
      final List<Note> NoteFromLocalDatasource =
          await NoteLocalDataSource.getNotes();
      return right(NoteFromLocalDatasource);
    } catch (_) {
      return left(const NoteFailure.noteDoesNotExist());
    }
  }

  @override
  Future<Option<NoteFailure>> addNote({required Note note}) async {
    try {
      await NoteLocalDataSource.addNote(note: note);
      return const None();
    } catch (_) {
      return const Some(NoteFailure.noteDoesNotExist());
    }
  }

  @override
  Future<Option<NoteFailure>> deleteNote({required Note note}) async {
    try {
      await NoteLocalDataSource.deleteNote(note: note);
      return const None();
    } catch (_) {
      return const Some(NoteFailure.noteDoesNotExist());
    }
  }

  @override
  Future<Option<NoteFailure>> editNoteById(
      {required UniqueId noteId, required Note editedNote}) async {
    try {
      await NoteLocalDataSource.editNoteById(
          noteId: noteId, editedNote: editedNote);
      return const None();
    } catch (_) {
      return const Some(NoteFailure.noteDoesNotExist());
    }
  }
}
