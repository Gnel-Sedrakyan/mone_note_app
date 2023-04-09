import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:mone_note_app/domain/notes/i_note_repository.dart';
import 'package:mone_note_app/domain/notes/note.dart';

part 'notes_store.g.dart';

@LazySingleton(as: NotesStore)
class NotesStoreImpl = NotesStore with _$NotesStoreImpl;

abstract class NotesStore with Store {
  final INoteRepository _noteRepository;

  NotesStore(this._noteRepository);

  // Observables
  @observable
  ObservableList<Note> notes = ObservableList<Note>();

  @observable
  ObservableList<Note> foundNotes = ObservableList<Note>();

  @observable
  String searchText = '';

  @observable
  String errorText = '';

  @observable
  bool isLoading = true;

  @observable
  Note? selectedNote;

  // Computed
  @computed
  List<Note> get filteredNotes =>
      notes.where((note) => note.title.contains(searchText)).toList();

  @computed
  bool get isEmpty => notes.isEmpty;

  @computed
  bool get isShowingSearchResults => searchText.isNotEmpty;

  // Actions
  @action
  Future<void> getNotes() async {
    isLoading = true;
    final notesListOrFailure = await _noteRepository.getNotes();

    notesListOrFailure.fold(
        (l) => errorText = l.maybeWhen(orElse: () {
              // TODO ste inch xndir kara lini? networkic chem vercnum eli vor asem internet chkar
              return "Some Error Occured";
            }),
        (notesList) => notes = ObservableList.of(notesList));
    isLoading = false;
  }

  @action
  Future<void> searchNotes() async {
    isLoading = true;
    final notesListOrFailure =
        await _noteRepository.getSearchingNotes(searchText: searchText);

    notesListOrFailure.fold(
        (l) => errorText = l.maybeWhen(orElse: () {
              // TODO ste inch xndir kara lini? networkic chem vercnum eli vor asem internet chkar
              return "Some Error Occured";
            }),
        (notesList) => foundNotes = ObservableList.of(notesList));
    isLoading = false;
  }

  @action
  Future<void> selectNote(Note note) async {
    selectedNote = note;
  }

  @action
  Future<void> unselectNote() async {
    selectedNote = null;
  }

  @action
  Future<void> add(Note note) async {
    final result = await _noteRepository.addNote(note: note);

    result.fold(() {
      notes.add(note);
    }, (failure) {});
  }

  @action
  Future<void> updateSelectedNote(String title, String content) async {
    selectedNote = selectedNote!.copyWith(title: title, content: content);

    final result = await _noteRepository.editNoteById(
        noteId: selectedNote!.id, title: title, content: content);

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
    searchNotes();
  }
}
