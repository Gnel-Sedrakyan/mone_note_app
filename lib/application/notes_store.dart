import 'package:mobx/mobx.dart';
import 'package:mone_note_app/domain/notes/i_note_repository.dart';
import 'package:mone_note_app/domain/notes/note.dart';

part 'notes_store.g.dart';

class NotesStore = _NotesStore with _$NotesStore;

abstract class _NotesStore with Store {
  final INoteRepository _noteRepository;

  _NotesStore(this._noteRepository);

  // Observables
  @observable
  ObservableList<Note> notes = ObservableList<Note>();

  @observable
  String searchText = '';

  @observable
  String errorText = '';

  // Computed
  @computed
  List<Note> get filteredNotes =>
      notes.where((note) => note.title.contains(searchText)).toList();

  // Actions
  @action
  Future<void> getNotes() async {
    final notesListOrFailure = await _noteRepository.getNotes();

    notesListOrFailure.fold(
        (l) => errorText = l.maybeWhen(orElse: () {
              // TODO ste inch xndir kara lini? networkic chem vercnum eli vor asem internet chkar
              return "Some Error Occured";
            }),
        (notesList) => notes = ObservableList.of(notesList));
  }

  @action
  Future<void> add(Note note) async {
    final result = await _noteRepository.addNote(note: note);

    result.fold(() {
      notes.add(note);
    }, (failure) {});
  }

  @action
  Future<void> update(Note note, String title, String content) async {
    final editedNote = note.copyWith(title: title, content: content);

    final result = await _noteRepository.editNoteById(
        noteId: note.id, editedNote: editedNote);

    result.fold(() {
      getNotes();
    }, (failure) {});
  }

  @action
  Future<void> delete(Note note) async {
    final result = await _noteRepository.deleteNote(note: note);

    result.fold(() {
      notes.remove(note);
    }, (failure) {});
  }

  @action
  void setSearchText(String text) {
    searchText = text;
  }
}
