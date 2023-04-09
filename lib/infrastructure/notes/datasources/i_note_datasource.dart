import 'package:mone_note_app/domain/core/value_objects.dart';
import 'package:mone_note_app/domain/notes/note.dart';
import 'package:mone_note_app/infrastructure/notes/models/note_model.dart';

abstract class INoteLocalDatasource {
  Future<List<Note>> searchNotes({required String searchText});

  Future<List<Note>> getNotes();

  Future<void> addNote({required Note note});

  Future<void> deleteNote({required Note note});

  Future<void> editNoteById(
      {required UniqueId noteId, required Note editedNote});
}
