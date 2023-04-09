import 'package:dartz/dartz.dart';
import 'package:mone_note_app/domain/core/value_objects.dart';
import 'package:mone_note_app/domain/notes/note.dart';
import 'package:mone_note_app/domain/notes/note_failure.dart';

abstract class INoteRepository {
  Future<Either<NoteFailure, List<Note>>> getNotes();
  Future<Either<NoteFailure, List<Note>>> getSearchingNotes({
    required String searchText,
  });
  Future<Option<NoteFailure>> addNote({
    required Note note,
  });
  Future<Option<NoteFailure>> deleteNote({
    required Note note,
  });
  Future<Option<NoteFailure>> editNoteById({
    required UniqueId noteId,
    required String title,
    required String content,
  });
}
